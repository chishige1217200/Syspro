    .text                   # テキストセグメント部（変数）
    .align 2                # 4バイト境界に揃える

_print_data:
    la      $a0, ghost      # ghostのアドレスを$a0にロード
    lw      $a0, 0($a0)     # $a0レジスタに対応するメモリ上のアドレスのワードを自身にロード
    li      $v0, 1          # $v0レジスタに1を代入

    .data                   # データセグメント部（定数）
    .align 2                # 4バイト境界に揃える
ghost:
    .word 12                # 12

    .text                   # テキストセグメント部（変数）
    syscall                 # システムコールの実行
    j       $ra             # 呼び出し元に戻る

main:                       # スタート
    subu    $sp, $sp, 24    # スタックを積む
    sw      $ra, 16($sp)    # $sp + 16番地のアドレスに$raの値をバックアップ
    jal     _print_data     # _print_dataのアドレスにジャンプ（次の命令のアドレスを$raに）
    lw      $ra, 16($sp)    # $sp + 16番地のアドレスから$raの値を復元
    addu    $sp, $sp, 24    # スタックを解放
    j       $ra             # 呼び出し元に戻る