    .text
    .align 2
main:
    move    $s2, $ra        # $s2にmainを呼び出した元のアドレスを格納
    li      $s0, 2          # $s0に2を格納(検索する数)
    li      $s1, 0          # $s1に0を格納(素数の個数カウント)
loop:
    move    $a0, $s0        # $s0の値を$a0にコピー
    jal     test_prime      # test_primeのアドレスにジャンプ(次の命令のアドレスを$raに)
    beqz    $v0, r1         # $v0が0ならば，r1に分岐
    addi    $s1, 1          # $s1に1を加える
    move    $a0, $s0        # $v0の値を$a0にコピー
    jal     print_int       # print_intのアドレスにジャンプ(次の命令のアドレスを$raに)
    la      $a0, space      # spaceのアドレスを$a0にロード
    jal     print_str       # print_strのアドレスにジャンプ(次の命令のアドレスを$raに)
r1:
    bge     $s1, 100, end   # $s1が100以上のとき，endにジャンプ
    addi    $s0, 1          # $s0に1を加える
    j       loop            # loopのアドレスにジャンプ
end:
    la      $a0, line       # lineのアドレスを$a0にロード
    jal     print_str       # print_strのアドレスにジャンプ(次の命令のアドレスを$raに)
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

    .data
    .align 2
space:
    .asciiz " "
    .align 2
line:
    .asciiz "\n"