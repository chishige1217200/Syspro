.data                               #書き換わることもあるデータセグメント
.align 2                            #2のn乗の境界上になるまで隙間を空けてくれる(丁度の場合は何もしない)という便利な指令
msg:
.byte 72, 101, 108, 108, 111, 0     #Hello

.text                               #テキストは通常，動作中に書き変えたりしないので，データセグメントと違って，ROM(Read Only Memory)上に配置することができる．
.align 2
        la      $a0, msg            #a0にmsgのアドレスを格納する
main:
        lb      $a1, 0($a0)         #a0の指し先の値を$a1にロードする
        beqz    $a1, out            #a1が0のとき，outへ
        jal     print               #printラベルにジャンプ
        addi    $a0, $a0, 1         #$a0に1を加える
        j       main                #mainに戻る
print:
        lw      $t0, 0xffff0008     #0xffff0008番地にある整数値を$t0にロードする
        li      $t1, 1              #$t1に1を代入する
        and     $t0, $t0, $t1       #$t0と$t1の論理積をとって$t0に代入する($t0は1ですか)
        beqz    $t0, print           #$t0が0とき，もう一度準備を試みる
        sw      $a1, 0xffff000c     #0xffff000c番地に$a1にある整数値を送る
        j       $ra                 #呼び出し元に戻る
out:
        j       $ra                 #return 0

