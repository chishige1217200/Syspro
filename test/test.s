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
	subu	$sp,$sp,32
	sw	$ra,28($sp)
	sw	$fp,24($sp)
	move	$fp,$sp
	sw	$a0,32($fp)
	sw	$zero,16($fp)
	sw	$zero,16($fp)
$L4:
	lw	$v1,32($fp)
	lw	$v0,16($fp)
	addu	$v0,$v1,$v0
	lb	$v0,0($v0)
	bne	$v0,$zero,$L7
	j	$L5
$L7:
	lw	$v1,32($fp)
	lw	$v0,16($fp)
	addu	$v0,$v1,$v0
	lbu	$v0,0($v0)
	sb	$v0,20($fp)
	lb	$v0,20($fp)
	slt	$v0,$v0,97
	bne	$v0,$zero,$L8
	lb	$v0,20($fp)
	slt	$v0,$v0,123
	beq	$v0,$zero,$L8
	lbu	$v0,20($fp)
	addu	$v0,$v0,-32
	sb	$v0,20($fp)
$L8:
	lb	$v0,20($fp)
	move	$a0,$v0
	jal	_print_char
	lw	$v0,16($fp)
	addu	$v0,$v0,1
	sw	$v0,16($fp)
	j	$L4
$L5:
	move	$sp,$fp
	lw	$ra,28($sp)
	lw	$fp,24($sp)
	addu	$sp,$sp,32
	j	$ra
	.align	2
_print_small_str:
	subu	$sp,$sp,32
	sw	$ra,28($sp)
	sw	$fp,24($sp)
	move	$fp,$sp
	sw	$a0,32($fp)
	sw	$zero,16($fp)
	sw	$zero,16($fp)
$L10:
	lw	$v1,32($fp)
	lw	$v0,16($fp)
	addu	$v0,$v1,$v0
	lb	$v0,0($v0)
	bne	$v0,$zero,$L13
	j	$L11
$L13:
	lw	$v1,32($fp)
	lw	$v0,16($fp)
	addu	$v0,$v1,$v0
	lbu	$v0,0($v0)
	sb	$v0,20($fp)
	lb	$v0,20($fp)
	slt	$v0,$v0,65
	bne	$v0,$zero,$L14
	lb	$v0,20($fp)
	slt	$v0,$v0,91
	beq	$v0,$zero,$L14
	lbu	$v0,20($fp)
	addu	$v0,$v0,32
	sb	$v0,20($fp)
$L14:
	lb	$v0,20($fp)
	move	$a0,$v0
	jal	_print_char
	lw	$v0,16($fp)
	addu	$v0,$v0,1
	sw	$v0,16($fp)
	j	$L10
$L11:
	move	$sp,$fp
	lw	$ra,28($sp)
	lw	$fp,24($sp)
	addu	$sp,$sp,32
	j	$ra
	.align	2
_read_char:
	subu	$sp,$sp,1064
	sw	$ra,1060($sp)
	sw	$fp,1056($sp)
	move	$fp,$sp
	addu	$a0,$fp,16
	li	$a1,1025			# 0x401
	jal	_read_string
	lbu	$v0,16($fp)
	sb	$v0,1048($fp)
	lb	$v0,1048($fp)
	move	$sp,$fp
	lw	$ra,1060($sp)
	lw	$fp,1056($sp)
	addu	$sp,$sp,1064
	j	$ra
	.align	2
_myprintf:
	sw	$a0,0($sp)
	sw	$a1,4($sp)
	sw	$a2,8($sp)
	sw	$a3,12($sp)
	subu	$sp,$sp,48
	sw	$ra,44($sp)
	sw	$fp,40($sp)
	move	$fp,$sp
	sw	$a0,48($fp)
	sw	$zero,20($fp)
$L17:
	lw	$v0,48($fp)
	lb	$v0,0($v0)
	bne	$v0,$zero,$L19
	j	$L18
$L19:
	lw	$v0,48($fp)
	lb	$v1,0($v0)
	li	$v0,37			# 0x25
	bne	$v1,$v0,$L20
	lw	$v0,48($fp)
	addu	$v0,$v0,1
	sw	$v0,48($fp)
	lw	$v0,20($fp)
	addu	$v0,$v0,1
	sw	$v0,20($fp)
	lw	$v0,48($fp)
	lb	$v0,0($v0)
	addu	$v0,$v0,-66
	sw	$v0,32($fp)
	lw	$v1,32($fp)
	sltu	$v0,$v1,50
	beq	$v0,$zero,$L29
	lw	$v0,32($fp)
	sll	$v1,$v0,2
	la	$v0,$L27
	addu	$v0,$v1,$v0
	lw	$v0,0($v0)
	j	$v0
	.rdata
	.align	3
$L27:
	.word	$L26
	.word	$L29
	.word	$L29
	.word	$L29
	.word	$L29
	.word	$L29
	.word	$L29
	.word	$L29
	.word	$L29
	.word	$L29
	.word	$L29
	.word	$L29
	.word	$L29
	.word	$L29
	.word	$L29
	.word	$L29
	.word	$L29
	.word	$L29
	.word	$L29
	.word	$L29
	.word	$L29
	.word	$L29
	.word	$L29
	.word	$L29
	.word	$L29
	.word	$L29
	.word	$L29
	.word	$L29
	.word	$L29
	.word	$L29
	.word	$L29
	.word	$L29
	.word	$L25
	.word	$L24
	.word	$L22
	.word	$L29
	.word	$L29
	.word	$L29
	.word	$L29
	.word	$L29
	.word	$L29
	.word	$L29
	.word	$L29
	.word	$L29
	.word	$L29
	.word	$L29
	.word	$L29
	.word	$L29
	.word	$L29
	.word	$L23
	.text
$L22:
	lw	$v0,20($fp)
	sll	$v0,$v0,2
	addu	$v1,$fp,48
	addu	$v0,$v0,$v1
	lw	$v0,0($v0)
	sw	$v0,16($fp)
	lw	$a0,16($fp)
	jal	_print_int
	j	$L29
$L23:
	lw	$v0,20($fp)
	sll	$v0,$v0,2
	addu	$v1,$fp,48
	addu	$v0,$v0,$v1
	lw	$v0,0($v0)
	sw	$v0,28($fp)
	lw	$a0,28($fp)
	jal	_print_string
	j	$L29
$L24:
	lw	$v0,20($fp)
	sll	$v0,$v0,2
	addu	$v1,$fp,48
	addu	$v0,$v0,$v1
	lbu	$v0,0($v0)
	sb	$v0,24($fp)
	lb	$v0,24($fp)
	move	$a0,$v0
	jal	_print_char
	j	$L29
$L25:
	lw	$v0,20($fp)
	sll	$v0,$v0,2
	addu	$v1,$fp,48
	addu	$v0,$v0,$v1
	lw	$v0,0($v0)
	sw	$v0,28($fp)
	lw	$a0,28($fp)
	jal	_print_small_str
	j	$L29
$L26:
	lw	$v0,20($fp)
	sll	$v0,$v0,2
	addu	$v1,$fp,48
	addu	$v0,$v0,$v1
	lw	$v0,0($v0)
	sw	$v0,28($fp)
	lw	$a0,28($fp)
	jal	_print_big_str
	j	$L29
$L20:
	lw	$v0,48($fp)
	lb	$v0,0($v0)
	move	$a0,$v0
	jal	_print_char
$L29:
	lw	$v0,48($fp)
	addu	$v0,$v0,1
	sw	$v0,48($fp)
	j	$L17
$L18:
	move	$sp,$fp
	lw	$ra,44($sp)
	lw	$fp,40($sp)
	addu	$sp,$sp,48
	j	$ra
	.align	2
_myscanf:
	sw	$a0,0($sp)
	sw	$a1,4($sp)
	sw	$a2,8($sp)
	sw	$a3,12($sp)
	subu	$sp,$sp,40
	sw	$ra,36($sp)
	sw	$fp,32($sp)
	move	$fp,$sp
	sw	$a0,40($fp)
$L31:
	lw	$v0,40($fp)
	lb	$v0,0($v0)
	bne	$v0,$zero,$L33
	j	$L32
$L33:
	lw	$v0,40($fp)
	lb	$v1,0($v0)
	li	$v0,37			# 0x25
	bne	$v1,$v0,$L34
	lw	$v0,40($fp)
	addu	$v0,$v0,1
	sw	$v0,40($fp)
	lw	$v0,40($fp)
	lb	$v0,0($v0)
	sw	$v0,28($fp)
	li	$v0,100			# 0x64
	lw	$v1,28($fp)
	beq	$v1,$v0,$L36
	lw	$v1,28($fp)
	slt	$v0,$v1,101
	beq	$v0,$zero,$L41
	li	$v0,99			# 0x63
	lw	$v1,28($fp)
	beq	$v1,$v0,$L38
	j	$L34
$L41:
	li	$v0,115			# 0x73
	lw	$v1,28($fp)
	beq	$v1,$v0,$L37
	j	$L34
$L36:
	lw	$v0,44($fp)
	sw	$v0,16($fp)
	jal	_read_int
	move	$v1,$v0
	lw	$v0,16($fp)
	sw	$v1,0($v0)
	j	$L34
$L37:
	lw	$v0,44($fp)
	sw	$v0,24($fp)
	lw	$a0,24($fp)
	li	$a1,1025			# 0x401
	jal	_read_string
	j	$L34
$L38:
	lw	$v0,44($fp)
	sw	$v0,20($fp)
	jal	_read_char
	move	$v1,$v0
	lw	$v0,20($fp)
	sb	$v1,0($v0)
$L34:
	lw	$v0,40($fp)
	addu	$v0,$v0,1
	sw	$v0,40($fp)
	j	$L31
$L32:
	move	$sp,$fp
	lw	$ra,36($sp)
	lw	$fp,32($sp)
	addu	$sp,$sp,40
	j	$ra
	.rdata
	.align	2
$LC0:
	.asciiz	"Starting %b...\n"
	.align	2
$LC1:
	.asciiz	"READER"
	.align	2
$LC2:
	.asciiz	"%s"
	.align	2
$LC3:
	.asciiz	"%s\n"
	.text
	.align	2
main:
	subu	$sp,$sp,1072
	sw	$ra,1068($sp)
	sw	$fp,1064($sp)
	move	$fp,$sp
	sw	$zero,16($fp)
	li	$v0,102			# 0x66
	sb	$v0,24($fp)
	li	$v0,-1			# 0xffffffff
	sw	$v0,28($fp)
	sw	$zero,36($fp)
	la	$a0,$LC0
	la	$a1,$LC1
	jal	_myprintf
	addu	$v0,$fp,40
	la	$a0,$LC2
	move	$a1,$v0
	jal	_myscanf
	addu	$v0,$fp,40
	la	$a0,$LC3
	move	$a1,$v0
	jal	_myprintf
	move	$v0,$zero
	move	$sp,$fp
	lw	$ra,1068($sp)
	lw	$fp,1064($sp)
	addu	$sp,$sp,1072
	j	$ra
