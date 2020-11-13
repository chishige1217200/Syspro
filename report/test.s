    .align 2
    .data

    .align 2
    .text

main:
    #lw      $a0, msg
    li      $a0, 0
    li      $v0, 1
    #li      $v1, 2
    .align 2
msg:
    .word 12

    .text
    syscall
    nop
    j       $ra