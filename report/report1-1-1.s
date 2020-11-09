    .data                   # 書き換わることもあるデータセグメント
    .align 2                # 2のn乗の境界上になるまで隙間を空けてくれる(丁度の場合は何もしない)という便利な指令
msg:
    .asciiz "Hello World"

    .text                   # テキストは通常，動作中に書き変えたりしないので，データセグメントと違って，ROM(Read Only Memory)上に配置することができる．
    .align 2
main:
    la      $a0, msg        # a0にmsgのアドレスを格納する
    move    $s0, $ra        # $s0にmainを呼び出した元のアドレスを格納
loop:
    lb      $a1, 0($a0)     # a0の指し先の値を$a1にロードする
    beqz    $a1, end        # a1が0のとき，endへ
    jal     print           # printのアドレスにジャンプ(次の命令のアドレスを$raに)
    addi    $a0, 1          # $a0に1を加える
    j       loop            # mainのアドレスにジャンプ
print:
    lw      $t0, 0xffff0008 # 0xffff0008番地にあるワードを$t0にロードする
    li      $t1, 1          # $t1に1を代入する
    and     $t0, $t0, $t1   # $t0と$t1の論理積をとって$t0に代入する($t0が1か確認する)
    beqz    $t0, print      # $t0が0のとき，もう一度準備を試みる
    sw      $a1, 0xffff000c # 0xffff000c番地に$a1にあるワードを送る
    j       $ra             # 呼び出し元に戻る
end:
    move    $ra, $s0        # mainを呼び出した元のアドレスを$raに復元
    j       $ra             # コンソールに戻る
