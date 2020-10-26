        .text
        .align 2
main:
        move    $s0, $ra                # mainを呼んだ戻り先のアドレスを$s0に保存しておく

        la      $a0, msg                # msgのアドレスを$a0にロード
        li      $v0, 4                  # print_string
        syscall                         # システムコールの実行

        li      $a0, 10                 # $a0に10を代入(任意のint値)

        jal     fact_start              # fact_startに飛ぶ
        move    $a0, $v0                # $a0に$v0の値をコピー
        li      $v0, 1                  # print_int
        syscall                         # システムコールの実行

        move    $ra, $s0                # mainを呼んだ戻り先のアドレスを$raに代入
        j       $ra                     # コンソールに戻る

fact_start:
        move    $t0, $a0                # $t0に$a0の値をコピー
        li      $t2,   1                # $t2に1を代入(分岐命令用)
        li      $t1,   1                # $t1に1を代入(計算結果保持)
fact:
        bgeu    $t2, $t0, fact_exit     # $t2が$t0より大きいとき，fact_exitへ
        mulo    $t1, $t0, $t1           # $t0と$t1をかけて$t1に代入
        addi    $t0, -1                 # $t0から1を引く
        j       fact
fact_exit:
        move    $v0, $t1                # $v0に$t1の値をコピー
        j       $ra

        .data
        .align 2
msg:
        .asciiz "The factorial of 10 is "
