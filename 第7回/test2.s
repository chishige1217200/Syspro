	.file	1 "test2.c"

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
	.asciiz	"WindowsXP"
	.align	2
_str2:
	.asciiz	"Windows6"
	.space	1
	.rdata
	.align	2
$LC0:
	.asciiz	"Windows7"
	.data
	.align	2
_str3:
	.word	$LC0
	.rdata
	.align	2
$LC1:
	.asciiz	"Windows8"
	.align	2
$LC2:
	.asciiz	"Windows10"
	.align	2
$LC3:
	.asciiz	"\n"
	.text
	.align	2
main:
	subu	$sp,$sp,48
	sw	$ra,44($sp)
	sw	$fp,40($sp)
	move	$fp,$sp
	addu	$v0,$fp,16
	addu	$v1,$fp,16
	la	$v0,$LC1
	lwl	$a0,3($v0)
	lwr	$a0,0($v0)
	lwl	$a1,7($v0)
	lwr	$a1,4($v0)
	lb	$a2,8($v0)
	swl	$a0,3($v1)
	swr	$a0,0($v1)
	swl	$a1,7($v1)
	swr	$a1,4($v1)
	sb	$a2,8($v1)
	la	$v0,$LC2
	sw	$v0,32($fp)
	la	$a0,_str1
	jal	_print_string
	la	$a0,$LC3
	jal	_print_string
	la	$a0,_str2
	jal	_print_string
	la	$a0,$LC3
	jal	_print_string
	lw	$a0,_str3
	jal	_print_string
	la	$a0,$LC3
	jal	_print_string
	addu	$a0,$fp,16
	jal	_print_string
	la	$a0,$LC3
	jal	_print_string
	lw	$a0,32($fp)
	jal	_print_string
	la	$a0,$LC3
	jal	_print_string
	move	$sp,$fp
	lw	$ra,44($sp)
	lw	$fp,40($sp)
	addu	$sp,$sp,48
	j	$ra
