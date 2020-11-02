    .text
    .align 2
main:
    subu    $sp, $sp, 32    # 32バイト確保
    sw      $ra, 20($sp)    # $sp + 20のアドレスにもともとの呼出しアドレスを保存
    sw      $fp, 16($sp)    # $sp + 16のアドレスに$fpを保存
    addu    $fp, $sp, 28    # 新しく$fpを設定
    li      $s0, 2          # $s0に2を格納
loop:
    move    $a0, $s0        # $s0の値を$a0にコピー
    jal     prime           # primeのアドレスにジャンプ(次の命令のアドレスを$raに)

    beqz    $v0, R1         # $v0が0ならば，R1に分岐
    move    $a0, $v0        # $v0の値を$a0にコピー
    li      $v0, 1          # $v0に1を代入(print_int)
    syscall
    la      $a0, space      # spaceのアドレスを$a0にロード
    li      $v0, 4          # $v0に4を代入(print_str)
    syscall
R1: #分岐1
    bge     $s0, 100, end   # $s0が100以上のとき，endにジャンプ
    addi    $s0, 1          # $s0に1を加える
    j       loop            # loopのアドレスにジャンプ
end:
    la      $a0, line       # lineのアドレスを$a0にロード
    li      $v0, 4          # $v0に4を代入(print_str)
    syscall
    lw      $ra, 20($sp)    # 保存しておいた$raを復元
    lw      $fp, 16($sp)    # 保存しておいた$fpを復元
    addu    $sp, $sp, 32    # スタックを開放
    j       $ra             # コンソールに戻る

prime:
    li      $t0, 1          # $t0に1を代入
    move    $t1, $a0        # $t1に$a0の値をコピー
prime_loop:
    div     $t1, $t0, $t2   # $t1を$t0で割った結果を$t2に代入する
    beq     $t0, $t1, prime_R1 # $t0と$t1が等しいときprime_R1のアドレスにジャンプ
    beq     $t2, $zero, prime_R2 # $t2が0ならprime_R2のアドレスにジャンプ
    addi    $t0, 1          # $t0に1を加える
    j       prime_loop      # prime_loopのアドレスにジャンプ
prime_R1:
    li      $v0, 1          # $v1に0を代入
    j       prime_end       # prime_endのアドレスにジャンプ
prime_R2:
    li      $v0, 0          # $v0に1を代入
prime_end:
    j       $ra             # 呼び出し元に戻る

    .data
    .align 2
space:
    .asciiz " "
    .align 2
line:
    .asciiz "\n"