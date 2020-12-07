    .text
    .align 2

# void print(int i)
_print_int:
    addiu   $sp,    24          # スタックの積立
    sw      $ra,    20($sp)     # $raレジスタの値をスタックに退避

    li      $v0,    1           # syscall用にprint_intを指定
    syscall                     # システムコールの実行

    lw      $ra,    20($sp)     # $raレジスタの値の復元
    addiu   $ra,    24          # スタックを解放
    j       $ra                 # 呼び出し元に戻る

_print_str:
    addiu   $sp,    24          # スタックの積立
    sw      $ra,    20($sp)     # $raレジスタの値をスタックに退避

    li      $v0,    4           # syscall用にprint_stringを指定
    syscall                     # システムコールの実行

    lw      $ra,    20($sp)     # $raレジスタの値の復元
    addiu   $ra,    24          # スタックを解放
    j       $ra                 # 呼び出し元に戻る

_read_int:
    addiu   $sp,    24          # スタックの積立
    sw      $ra,    20($sp)     # $raレジスタの値をスタックに退避

    li      $v0,    5           # syscall用にread_intを指定
    syscall                     # システムコールの実行

    lw      $ra,    20($sp)     # $raレジスタの値の復元
    addiu   $ra,    24          # スタックを解放
    j       $ra                 # 呼び出し元に戻る

_read_str:
    addiu   $sp,    24          # スタックの積立
    sw      $ra,    20($sp)     # $raレジスタの値をスタックに退避

    li      $v0,    8           # syscall用にread_stringを指定
    syscall                     # システムコールの実行

    lw      $ra,    20($sp)     # $raレジスタの値の復元
    addiu   $ra,    24          # スタックを解放
    j       $ra                 # 呼び出し元に戻る