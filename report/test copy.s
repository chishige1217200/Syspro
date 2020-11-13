    .align 2
    .data

    .align 2
    .text

main:
    li      $a0, 0
    li      $v0, 1

    .word 1

    .align 2
    .word 2

    .align 2
    .word 3

    .align 2
    .word 4

    .align 2
    .word 5

    .align 2
    .word 6

    .align 2
    .word 7

    .align 2
    .word 8

    .align 2
    .word 9

    .align 2
    .word 10

    .align 2
    .word 11

    .align 2
    .word 12

    .text
    syscall
    nop
    j       $ra