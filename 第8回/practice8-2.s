	.file	1 "practice8-2.c"

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


	.text
	.align	2
_print_char:
	subu	$sp,$sp,40
	sw	$ra,36($sp)
	sw	$fp,32($sp)
	move	$fp,$sp
	move	$v0,$a0
	sb	$v0,16($fp)
	lbu	$v0,16($fp)
	sb	$v0,24($fp)
	sb	$zero,25($fp)
	addu	$v0,$fp,24
	move	$a0,$v0
	jal	_print_string
	move	$sp,$fp
	lw	$ra,36($sp)
	lw	$fp,32($sp)
	addu	$sp,$sp,40
	j	$ra
	.align	2
_print_big_str:
	subu	$sp,$sp,24
	sw	$ra,20($sp)
	sw	$fp,16($sp)
	move	$fp,$sp
	sw	$a0,24($fp)
	lw	$a0,24($fp)
	jal	_print_string
	move	$sp,$fp
	lw	$ra,20($sp)
	lw	$fp,16($sp)
	addu	$sp,$sp,24
	j	$ra
	.align	2
_print_small_str:
	subu	$sp,$sp,24
	sw	$ra,20($sp)
	sw	$fp,16($sp)
	move	$fp,$sp
	sw	$a0,24($fp)
	lw	$a0,24($fp)
	jal	_print_string
	move	$sp,$fp
	lw	$ra,20($sp)
	lw	$fp,16($sp)
	addu	$sp,$sp,24
	j	$ra
	.align	2
_print_hex_int:
	subu	$sp,$sp,8
	sw	$fp,0($sp)
	move	$fp,$sp
	sw	$a0,8($fp)
	move	$sp,$fp
	lw	$fp,0($sp)
	addu	$sp,$sp,8
	j	$ra
	.align	2
_myprintf:
	sw	$a0,0($sp)
	sw	$a1,4($sp)
	sw	$a2,8($sp)
	sw	$a3,12($sp)
	subu	$sp,$sp,40
	sw	$ra,36($sp)
	sw	$fp,32($sp)
	move	$fp,$sp
	sw	$a0,40($fp)
	sw	$zero,20($fp)
$L7:
	lw	$v0,40($fp)
	lb	$v0,0($v0)
	bne	$v0,$zero,$L9
	j	$L8
$L9:
	lw	$v0,40($fp)
	lb	$v1,0($v0)
	li	$v0,37			# 0x25
	bne	$v1,$v0,$L10
	lw	$v0,40($fp)
	addu	$v0,$v0,1
	sw	$v0,40($fp)
	lw	$v0,20($fp)
	addu	$v0,$v0,1
	sw	$v0,20($fp)
	lw	$v0,40($fp)
	lb	$v0,0($v0)
	addu	$v0,$v0,-66
	sw	$v0,28($fp)
	lw	$v1,28($fp)
	sltu	$v0,$v1,50
	beq	$v0,$zero,$L19
	lw	$v0,28($fp)
	sll	$v1,$v0,2
	la	$v0,$L17
	addu	$v0,$v1,$v0
	lw	$v0,0($v0)
	j	$v0
	.rdata
	.align	3
$L17:
	.word	$L16
	.word	$L19
	.word	$L19
	.word	$L19
	.word	$L19
	.word	$L19
	.word	$L19
	.word	$L19
	.word	$L19
	.word	$L19
	.word	$L19
	.word	$L19
	.word	$L19
	.word	$L19
	.word	$L19
	.word	$L19
	.word	$L19
	.word	$L19
	.word	$L19
	.word	$L19
	.word	$L19
	.word	$L19
	.word	$L19
	.word	$L19
	.word	$L19
	.word	$L19
	.word	$L19
	.word	$L19
	.word	$L19
	.word	$L19
	.word	$L19
	.word	$L19
	.word	$L15
	.word	$L14
	.word	$L12
	.word	$L19
	.word	$L19
	.word	$L19
	.word	$L19
	.word	$L19
	.word	$L19
	.word	$L19
	.word	$L19
	.word	$L19
	.word	$L19
	.word	$L19
	.word	$L19
	.word	$L19
	.word	$L19
	.word	$L13
	.text
$L12:
	lw	$v0,20($fp)
	sll	$v0,$v0,2
	addu	$v1,$fp,40
	addu	$v0,$v0,$v1
	lw	$v0,0($v0)
	sw	$v0,16($fp)
	lw	$a0,16($fp)
	jal	_print_int
	j	$L19
$L13:
	lw	$v0,20($fp)
	sll	$v0,$v0,2
	addu	$v1,$fp,40
	addu	$v0,$v0,$v1
	lw	$v0,0($v0)
	sw	$v0,24($fp)
	lw	$a0,24($fp)
	jal	_print_string
	j	$L19
$L14:
	lw	$v0,20($fp)
	sll	$v0,$v0,2
	addu	$v1,$fp,40
	addu	$v0,$v0,$v1
	lw	$v0,0($v0)
	sw	$v0,24($fp)
	lw	$v0,24($fp)
	lb	$v0,0($v0)
	move	$a0,$v0
	jal	_print_char
	j	$L19
$L15:
	lw	$v0,20($fp)
	sll	$v0,$v0,2
	addu	$v1,$fp,40
	addu	$v0,$v0,$v1
	lw	$v0,0($v0)
	sw	$v0,24($fp)
	lw	$a0,24($fp)
	jal	_print_small_str
	j	$L19
$L16:
	lw	$v0,20($fp)
	sll	$v0,$v0,2
	addu	$v1,$fp,40
	addu	$v0,$v0,$v1
	lw	$v0,0($v0)
	sw	$v0,24($fp)
	lw	$a0,24($fp)
	jal	_print_big_str
	j	$L19
$L10:
	lw	$v0,40($fp)
	lb	$v0,0($v0)
	move	$a0,$v0
	jal	_print_char
$L19:
	lw	$v0,40($fp)
	addu	$v0,$v0,1
	sw	$v0,40($fp)
	j	$L7
$L8:
	move	$sp,$fp
	lw	$ra,36($sp)
	lw	$fp,32($sp)
	addu	$sp,$sp,40
	j	$ra
	.rdata
	.align	2
$LC0:
	.asciiz	"TEST %d is %s ...\n"
	.align	2
$LC1:
	.asciiz	"OK"
	.align	2
$LC2:
	.asciiz	"All done\n"
	.text
	.align	2
main:
	subu	$sp,$sp,24
	sw	$ra,20($sp)
	sw	$fp,16($sp)
	move	$fp,$sp
	la	$a0,$LC0
	li	$a1,99			# 0x63
	la	$a2,$LC1
	jal	_myprintf
	la	$a0,$LC2
	jal	_print_string
	move	$v0,$zero
	move	$sp,$fp
	lw	$ra,20($sp)
	lw	$fp,16($sp)
	addu	$sp,$sp,24
	j	$ra
