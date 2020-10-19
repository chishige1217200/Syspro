        .text
        .align 2
main:   
        la      $a0, msg    #表示1
        li      $v0, 4
        syscall
        
        li      $v0, 5      #入力1
        syscall
        move    $t0, $v0
        
        la      $a0, msg2   #表示2
        li      $v0, 4
        syscall        

        li      $v0, 5      #入力2
        syscall
        move    $t1, $v0

        la      $a0, msg3   #表示3
        li      $v0, 4
        syscall    

        add     $a1, $t0, $t1   #足し算と表示
        move    $a0, $a1
        li      $v0, 1
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
