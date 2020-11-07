    .text
    .align 2
main:
    move    $s0, $ra        # mainを呼んだ戻り先のアドレスを$s0に保存しておく

    la      $a0, msg        # msgのアドレスを$a0にロード
    jal     print_str       # print_strのアドレスにジャンプ(次の命令のアドレスを$raに)

    li      $a0, 10         # $a0に10を代入(任意のint値)

    jal     fact            # factに飛ぶ
    move    $a0, $v0        # $a0に$v0の値をコピー
    jal     print_int       # print_intのアドレスにジャンプ(次の命令のアドレスを$raに)

    la      $a0, msg2       # msg2のアドレスを$a0にロード
    jal     print_str       # print_strのアドレスにジャンプ(次の命令のアドレスを$raに)

    move    $ra, $s0        # mainを呼んだ戻り先のアドレスを$raに代入
    j       $ra             # コンソールに戻る

fact:
    subu    $sp, $sp, 32    # 32バイト確保
    sw      $ra, 20($sp)    # $sp + 20のアドレスにもともとの呼出しアドレスを保存
    sw      $fp, 16($sp)    # $sp + 16のアドレスに$fpを保存
    sw      $a0, 24($sp)    # $sp + 24のアドレスに$a0を保存
    addu    $fp, $sp, 28    # 新しく$fpを設定

    li      $t0,   1        # $t0に1を代入(分岐命令用)

    bgeu    $a0, $t0, else  # $a0が$t0より小さいとき，elseへ
    li      $v0, 1          # $v0に1を代入
    lw      $ra, 20($sp)    # 保存しておいた$spを復元
    lw      $fp, 16($sp)    # 保存しておいた$fpを復元
    addu    $sp, $sp, 32    # スタックを開放
    j       $ra             # 呼び出し元に戻る
else:
    addi    $a0, -1         # $a0から1を引く
    jal     fact            # 再帰呼び出しをする

    lw      $ra, 20($sp)    # 保存しておいた$spを復元
    lw      $fp, 16($sp)    # 保存しておいた$fpを復元
    lw      $a0, 24($sp)    # 対応する$a0の値を復元
    addu    $sp, $sp, 32    # スタックを開放

    mulo    $v0, $a0, $v0   # $v0と$a0をかけて$v0に代入
    j       $ra             # 呼び出し元に戻る

print_int:
    li      $v0, 1          # $v0に1を代入
    syscall                 # システムコールの実行
    j       $ra             # 呼び出し元に戻る
print_str:
    li      $v0, 4          # $v0に4を代入
    syscall                 # システムコールの実行
    j       $ra             # 呼び出し元に戻る

    .data
    .align 2
msg:
    .asciiz "The factorial of 10 is "

    .align 2
msg2:
    .asciiz "\n"
