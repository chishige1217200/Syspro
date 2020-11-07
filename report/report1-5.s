    .text
    .align 2
main:
    move    $s2, $ra        # $s2にmainを呼び出した元のアドレスを格納
    li      $s0, 2          # $s0に2を格納(検索する数)
    li      $s1, 0          # $s1に0を格納(素数の個数カウント)
    la      $s3, prime_array# $s3にprime_arrayのアドレスをロード
loop:
    move    $a0, $s0        # $s0の値を$a0にコピー
    jal     test_prime      # test_primeのアドレスにジャンプ(次の命令のアドレスを$raに)
    beqz    $v0, r1         # $v0が0ならば，r1に分岐
    addi    $s1, 1          # $s1に1を加える
    # ここで配列にデータを格納
    move    $t0, $s1        # $s1の値を$t0にコピー
    mulo    $t0, $t0, 4     # $t0を4倍(4byte区切り)
    add     $t0, $t0, $s3   # $t0と$s3を足して$t0に格納
    sw      $s0, 0($t0)     # $s0の値を配列上にコピー
r1:
    bge     $s1, 100, loop2 # $s1が100以上のとき，loop2にジャンプ
    addi    $s0, 1          # $s0に1を加える
    j       loop            # loopのアドレスにジャンプ
loop2:
    la      $a0, indicate   # indicateのアドレスを$a0にロード
    jal     print_str       # print_strのアドレスにジャンプ(次の命令のアドレスを$raに)
    #入力受付
    jal     read_int        # read_intのアドレスにジャンプ(次の命令のアドレスを$raに)
    # 例外確認
    bge     $v0, 101, end   # 入力が101以上の場合，終了
    ble     $v0, 0, end     # 入力が0以下の場合，終了
    # 正しい番地を計算
    move    $t0, $v0        # $v0の値を$t0にコピー
    mulo    $t0, $t0, 4     # $t0を4倍(4byte区切り)
    add     $t0, $t0, $s3   # $t0と$s3を足して$t0に格納
    # 配列から読みだした値を表示
    lw      $a0, 0($t0)     # $s0の値を配列上にコピー
    jal     print_int       # print_intのアドレスにジャンプ(次の命令のアドレスを$raに)
    la      $a0, line       # lineのアドレスを$a0にロード
    jal     print_str       # print_strのアドレスにジャンプ(次の命令のアドレスを$raに)
    j       loop2
end:
    move    $ra, $s2        # mainを呼び出した元のアドレスを$raに復元
    j       $ra             # コンソールに戻る

test_prime:
    li      $t0, 2          # $t0に2を代入
    move    $t1, $a0        # $t1に$a0の値をコピー
prime_loop:
    rem     $t2, $t1, $t0   # $t1を$t0で割った余りを$t2に代入する
    beq     $t0, $t1, prime_r1 # $t0と$t1が等しいときprime_r1のアドレスにジャンプ
    beqz    $t2, prime_r2   # $t2が0ならprime_r2のアドレスにジャンプ
    addi    $t0, 1          # $t0に1を加える
    j       prime_loop      # prime_loopのアドレスにジャンプ
prime_r1:
    li      $v0, 1          # $v0に1を代入
    j       prime_end       # prime_endのアドレスにジャンプ
prime_r2:
    li      $v0, 0          # $v0に0を代入
prime_end:
    j       $ra             # 呼び出し元に戻る

print_int:
    li      $v0, 1          # $v0に1を代入
    syscall                 # システムコールの実行
    j       $ra             # 呼び出し元に戻る
print_str:
    li      $v0, 4          # $v0に4を代入
    syscall                 # システムコールの実行
    j       $ra             # 呼び出し元に戻る
read_int:
    li      $v0, 5          # read_int(戻り値は$v0に，1~100のみ入力可)
    syscall                 # 読み取り
    j       $ra             # 呼び出し元に戻る

    .data
    .align 2
indicate:
    .asciiz ">"
    .align 2
line:
    .asciiz "\n"
    .align 2
prime_array:
    .space 400
