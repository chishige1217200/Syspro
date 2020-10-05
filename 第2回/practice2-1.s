        .text
        .align 2

# 引数 $a0 の ASCII コードに対応する文字を出力する
main:
        li      $a0, 65                 # $a0 に引数 'A' == 65
putc:
        lw      $t0, 0xffff0008         # $t0 = *(0xffff0008)
        li      $t1, 1                  # $t1 = 1
        and     $t0, $t0, $t1           # $t0 &= $t1
        beqz    $t0, putc               # if ($t0 == 0) goto putc
        sw      $a0, 0xffff000c         # *(0xffff000c) = $a0
        j       $ra                     # return