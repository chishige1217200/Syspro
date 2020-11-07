    .text
    .align 2

_print_data:
    la      $a0, ghost
    lw      $a0, 0($a0)
    li      $v0, 1

    .data
    .align 2
ghost:
    .word 12

    .text
    syscall
    j       $ra

main:
    subu    $sp, $sp, 24
    sw      $ra, 16($sp)
    jal     _print_data
    lw      $ra, 16($sp)
    addu    $sp, $sp, 24
    j       $ra