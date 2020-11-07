    .text                   # テキストセグメント
    .align 2                # バイトを揃える
main:
    la      $a0, msg        # msg のアドレスを $a0 に格納
    li      $v0, 4          # print_stringを指定
    syscall                 # システムコールの実行
    j       $ra             # コンソールに戻る

    .data                   # データセグメント
    .align 2                # バイトを揃える
msg:
    .asciiz "Hello World"   # 出力文字情報
