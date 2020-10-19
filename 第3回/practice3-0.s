   .text
   .align 2
main:
   li   $v0, 1   # No = 1 (print_int)
   li   $a0, 5   # 5 を表示 '5' ではない（文字ではなく文字列）
   syscall       # 画面に '5' と出る
   j    $ra
