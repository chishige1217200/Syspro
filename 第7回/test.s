	.file	1 "test.c"

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


	.data
	.align	2
_str1:
	.asciiz	"Windows7"
	.align	2
_str2:
	.asciiz	"Windows8"
	.space	1
	.rdata
	.align	2
$LC0:
	.asciiz	"Windows10"
	.data
	.align	2
_str3:
	.word	$LC0
	.rdata
	.align	2
$LC1:
	.asciiz	"\n"
	.text
	.align	2
main:
	subu	$sp,$sp,24
	sw	$ra,20($sp)
	sw	$fp,16($sp)
	move	$fp,$sp
	la	$a0,_str1
	jal	_print_string
	la	$a0,$LC1
	jal	_print_string
	la	$a0,_str2
	jal	_print_string
	la	$a0,$LC1
	jal	_print_string
	lw	$a0,_str3
	jal	_print_string
	la	$a0,$LC1
	jal	_print_string
	move	$sp,$fp
	lw	$ra,20($sp)
	lw	$fp,16($sp)
	addu	$sp,$sp,24
	j	$ra
