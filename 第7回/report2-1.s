	.file	1 "report2-1.c"

 # -G value = 0, Arch = r2000, ISA = 1
 # GNU C version 2.96 20000731 (Red Hat Linux 7.3 2.96-113.2) (mipsel-linux) compiled by GNU C version 2.96 20000731 (Red Hat Linux 7.3 2.96-113.2).
 # options passed:  -mno-abicalls -mrnames -mmips-as
 # -mno-check-zero-division -march=r2000 -O0 -fleading-underscore
 # -finhibit-size-directive -fverbose-asm
 # options enabled:  -fpeephole -ffunction-cse -fkeep-static-consts
 # -fpcc-struct-return -fsched-interblock -fsched-spec -fbranch-count-reg
 # -fnew-exceptions -fcommon -finhibit-size-directive -fverbose-asm
 # -fgnu-linker -fargument-alias -fleading-underscore -fident -fmath-errno
 # -mrnames -mno-check-zero-division -march=r2000


	.rdata				# 読み取り専用データセグメント
	.align	2			# バイト揃え
$LC0:
	.asciiz	"ABCDEFG"	# 文字列情報
	.data				# データセグメント
	.align	2			# バイト揃え
_string_ptr:			# ポインタ
	.word	$LC0		# アドレスを参照
	.align	2			# バイト揃え
_string_ary:			# 配列
	.asciiz	"ABCDEFG"	# 文字列情報
	.rdata				# 読み取り専用データセグメント
	.align	2			# バイト揃え
$LC1:
	.asciiz	" = "		# 文字列情報
	.align	2			# バイト揃え
$LC2:
	.asciiz	"\n"		# 文字列情報
	.text				# テキストセグメント
	.align	2			# バイト揃え
_print_var:
	subu	$sp,$sp,24	# スタックの積立（24バイト）
	sw	$ra,20($sp)		# $sp + 20番地のアドレスに$raの値をバックアップ
	sw	$fp,16($sp)		# $sp + 16番地のアドレスに$fpの値をバックアップ
	move	$fp,$sp		# $spの値で$fpを上書き
	sw	$a0,24($fp)		# $fp($sp) + 24番地のアドレスに$a0の値をバックアップ（境界跨ぎ）
	sw	$a1,28($fp)		# $fp($sp) + 28番地のアドレスに$a1の値をバックアップ（境界跨ぎ）
	lw	$a0,24($fp)		# 元$a0の値のバックアップをスタックからロード（同時にprint_stringの引数に）
	jal	_print_string	# print_stringの呼び出し
	la	$a0,$LC1		# "="を指すアドレスを$a0にロード
	jal	_print_string	# print_stringの呼び出し
	lw	$a0,28($fp)		# 元$a1の値のバックアップをスタックからロード（同時にprint_stringの引数に）
	jal	_print_int		# print_intの呼び出し
	la	$a0,$LC2		# "\n"を指すアドレスを$a0にロード
	jal	_print_string	# print_stringの呼び出し
	move	$sp,$fp		# $fpの値で$spを上書き
	lw	$ra,20($sp)		# $sp + 20番地のアドレスから$raの値を復元
	lw	$fp,16($sp)		# $sp + 16番地のアドレスから$fpの値を復元
	addu	$sp,$sp,24	# スタックの解放
	j	$ra				# 呼び出し元に戻る
	.rdata				# 読み取り専用テキストセグメント
	.align	2			# バイト揃え
$LC3:
	.asciiz	"primes_stat[0]"	# 文字列情報
	.align	2					# バイト揃え
$LC4:
	.asciiz	"primes_auto[0]"	# 文字列情報
	.text						# テキストセグメント
	.align	2					# バイト揃え
main:
	subu	$sp,$sp,64			# スタックの積立（64バイト）
	sw	$ra,60($sp)				# $sp + 60番地のアドレスに$raの値をバックアップ
	sw	$fp,56($sp)				# $sp + 56番地のアドレスに$fpの値をバックアップ
	move	$fp,$sp				# $spの値で$fpを上書き
	li	$v0,2					# 0x2
	sw	$v0,_primes_stat		# _primes_statに対応するラベルのメモリ上のアドレスに$v0の値を保存
	li	$v0,3					# 0x3
	sw	$v0,16($fp)				# $fp($sp) + 16番地のアドレスに$v0の値をバックアップ
	la	$a0,$LC3				# "primes_stat[0]"を指すアドレスを$a0にロード
	lw	$a1,_primes_stat		# _primes_statに対応するラベルのメモリ上のアドレスの値を$a1にロード
	jal	_print_var				# print_varの呼び出し
	la	$a0,$LC4				# "primes_auto[0]"を指すアドレスを$a0にロード
	lw	$a1,16($fp)				# 元$v0の値のバックアップをスタックから$a1にロード（同時にprint_stringの引数に）
	jal	_print_var				# print_varの呼び出し
	move	$sp,$fp				# $fpの値で$spを上書き
	lw	$ra,60($sp)				# $sp + 60番地のアドレスから$raの値を復元
	lw	$fp,56($sp)				# $sp + 56番地のアドレスから$fpの値を復元
	addu	$sp,$sp,64			# スタックの解放
	j	$ra						# 呼び出し元に戻る

	.comm	_primes_stat,40
