        .text
        .align 2
main:
        move    $s0, $ra        # mainを呼んだ戻り先のアドレスを$s0に保存しておく
        
        la      $a0, msg        # 表示1
        jal     print_str
        
        jal     read_int        # 入力1
        move    $t0, $v0
        
        la      $a0, msg2       # 表示2
        jal     print_str

        jal     read_int        # 入力2
        move    $t1, $v0

        la      $a0, msg3       # 表示3
        jal     print_str

        add     $a1, $t0, $t1   # 足し算と表示4
        move    $a0, $a1
        jal     print_int
        
        move    $ra, $s0        # mainを呼んだ戻り先のアドレスを$raに代入
        j       $ra             # mainを呼んだ戻り先へ戻る(終了)

        .align 2
print_str:                      # 文字列の表示
        li      $v0, 4
        syscall
        j       $ra

        .align 2
print_int:                      # 整数値の表示
        li      $v0, 1
        syscall
        j       $ra

        .align 2
read_int:                       # 整数値の入力
        li      $v0, 5
        syscall
        j       $ra
        
        .data
        .align 2
msg:
        .asciiz "Input 1: "

        .align 2
msg2:
        .asciiz "Input 2: "
        
msg3:
        .asciiz "Result: "
