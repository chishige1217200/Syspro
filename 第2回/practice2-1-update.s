        .text
        .align 2

# 引数 $a0 の ASCII コードに対応する文字を出力する
main:
        li      $a0, 72                 # $a0 に引数 'H' == 72
putc1:
        lw      $t0, 0xffff0008         # $t0 = *(0xffff0008)
        li      $t1, 1                  # $t1 = 1
        and     $t0, $t0, $t1           # $t0 &= $t1
        beqz    $t0, putc1               # if ($t0 == 0) goto putc1
        sw      $a0, 0xffff000c         # *(0xffff000c) = $a0
        
main2:
        li      $a0, 101                 # $a0 に引数 'e' == 101
putc2:
        lw      $t0, 0xffff0008         # $t0 = *(0xffff0008)
        li      $t1, 1                  # $t1 = 1
        and     $t0, $t0, $t1           # $t0 &= $t1
        beqz    $t0, putc2               # if ($t0 == 0) goto putc2
        sw      $a0, 0xffff000c         # *(0xffff000c) = $a0

main3:
        li      $a0, 108                 # $a0 に引数 'l' == 108
putc3:
        lw      $t0, 0xffff0008         # $t0 = *(0xffff0008)
        li      $t1, 1                  # $t1 = 1
        and     $t0, $t0, $t1           # $t0 &= $t1
        beqz    $t0, putc3               # if ($t0 == 0) goto putc3
        sw      $a0, 0xffff000c         # *(0xffff000c) = $a0

main4:
        li      $a0, 108                 # $a0 に引数 'l' == 108
putc4:
        lw      $t0, 0xffff0008         # $t0 = *(0xffff0008)
        li      $t1, 1                  # $t1 = 1
        and     $t0, $t0, $t1           # $t0 &= $t1
        beqz    $t0, putc4               # if ($t0 == 0) goto putc4
        sw      $a0, 0xffff000c         # *(0xffff000c) = $a0

main5:
        li      $a0, 111                 # $a0 に引数 'o' == 111
putc5:
        lw      $t0, 0xffff0008         # $t0 = *(0xffff0008)
        li      $t1, 1                  # $t1 = 1
        and     $t0, $t0, $t1           # $t0 &= $t1
        beqz    $t0, putc5               # if ($t0 == 0) goto putc5
        sw      $a0, 0xffff000c         # *(0xffff000c) = $a0
     
        j       $ra                     # return
