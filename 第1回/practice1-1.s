        .text                   # textセグメントに配置する指定
        .align 2                # 4バイト境界に配置する指定

main:                           # main(ここから実行開始)
        move    $a0,$zero       # $a0 : SUM = 0
        li      $v1,1           # $v1 : COUNT = 1
loop:
        addu    $a0,$a0,$v1     # SUM += COUNT
        addu    $v1,$v1,1       # COUNT++
        slt     $v0,$v1,6       # $v0 = COUNT < 6 ? 1 : 0
        bnez    $v0,loop        # if ($v0 != 0) goto loop
        move    $t0,$a0         # $t0 = SUM
        j       $ra             # return
