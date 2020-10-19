        .text                           # テキストセグメント
        .align 2                        # バイトを揃える
main:   
        la      $a0, msg                # msg のアドレスを $t2 に
        li      $v0, 4                  # print_string
        syscall                         # システムコールの実行
        j       $ra                     # mainを呼んだ戻り先に飛ぶ
  
        .data                           # データセグメント
        .align 2                        # バイトを揃える
msg:    
        .asciiz "Hello World"           # 出力文字情報
