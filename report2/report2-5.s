	.file	1 "report2-5.c"

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


	.rdata
	.align	2
$LC0:
	.asciiz	"%d"
	.text
	.align	2
_read_int:
	.file	2 "spim.h"
	subu	$sp,$sp,1056
	sw	$ra,1052($sp)
	sw	$fp,1048($sp)
	move	$fp,$sp
	addu	$a0,$fp,16
	li	$a1,1024			# 0x400
	lw	$a2,_stdin
	jal	_fgets
	bne	$v0,$zero,$L3
	move	$v0,$zero
	j	$L2
$L3:
	addu	$v0,$fp,1040
	addu	$a0,$fp,16
	la	$a1,$LC0
	move	$a2,$v0
	jal	_sscanf
	lw	$v0,1040($fp)
$L2:
	move	$sp,$fp
	lw	$ra,1052($sp)
	lw	$fp,1048($sp)
	addu	$sp,$sp,1056
	j	$ra
	.align	2
_read_string:
	subu	$sp,$sp,24
	sw	$ra,20($sp)
	sw	$fp,16($sp)
	move	$fp,$sp
	sw	$a0,24($fp)
	sw	$a1,28($fp)
	lw	$a0,24($fp)
	lw	$a1,28($fp)
	lw	$a2,_stdin
	jal	_fgets
	move	$sp,$fp
	lw	$ra,20($sp)
	lw	$fp,16($sp)
	addu	$sp,$sp,24
	j	$ra
	.rdata
	.align	2
$LC1:
	.asciiz	"%s"
	.text
	.align	2
_print_char:
	.file	3 "report2-5.c"
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
	la	$a0,$LC1
	move	$a1,$v0
	jal	_printf
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
$L7:
	lw	$v1,32($fp)
	lw	$v0,16($fp)
	addu	$v0,$v1,$v0
	lb	$v0,0($v0)
	bne	$v0,$zero,$L10
	j	$L8
$L10:
	lw	$v1,32($fp)
	lw	$v0,16($fp)
	addu	$v0,$v1,$v0
	lbu	$v0,0($v0)
	sb	$v0,20($fp)
	lb	$v0,20($fp)
	slt	$v0,$v0,97
	bne	$v0,$zero,$L11
	lb	$v0,20($fp)
	slt	$v0,$v0,123
	beq	$v0,$zero,$L11
	lbu	$v0,20($fp)
	addu	$v0,$v0,-32
	sb	$v0,20($fp)
$L11:
	lb	$v0,20($fp)
	move	$a0,$v0
	jal	_print_char
	lw	$v0,16($fp)
	addu	$v0,$v0,1
	sw	$v0,16($fp)
	j	$L7
$L8:
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
$L13:
	lw	$v1,32($fp)
	lw	$v0,16($fp)
	addu	$v0,$v1,$v0
	lb	$v0,0($v0)
	bne	$v0,$zero,$L16
	j	$L14
$L16:
	lw	$v1,32($fp)
	lw	$v0,16($fp)
	addu	$v0,$v1,$v0
	lbu	$v0,0($v0)
	sb	$v0,20($fp)
	lb	$v0,20($fp)
	slt	$v0,$v0,65
	bne	$v0,$zero,$L17
	lb	$v0,20($fp)
	slt	$v0,$v0,91
	beq	$v0,$zero,$L17
	lbu	$v0,20($fp)
	addu	$v0,$v0,32
	sb	$v0,20($fp)
$L17:
	lb	$v0,20($fp)
	move	$a0,$v0
	jal	_print_char
	lw	$v0,16($fp)
	addu	$v0,$v0,1
	sw	$v0,16($fp)
	j	$L13
$L14:
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
$L20:
	lw	$v0,48($fp)
	lb	$v0,0($v0)
	bne	$v0,$zero,$L22
	j	$L21
$L22:
	lw	$v0,48($fp)
	lb	$v1,0($v0)
	li	$v0,37			# 0x25
	bne	$v1,$v0,$L23
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
	beq	$v0,$zero,$L32
	lw	$v0,32($fp)
	sll	$v1,$v0,2
	la	$v0,$L30
	addu	$v0,$v1,$v0
	lw	$v0,0($v0)
	j	$v0
	.rdata
	.align	3
$L30:
	.word	$L29
	.word	$L32
	.word	$L32
	.word	$L32
	.word	$L32
	.word	$L32
	.word	$L32
	.word	$L32
	.word	$L32
	.word	$L32
	.word	$L32
	.word	$L32
	.word	$L32
	.word	$L32
	.word	$L32
	.word	$L32
	.word	$L32
	.word	$L32
	.word	$L32
	.word	$L32
	.word	$L32
	.word	$L32
	.word	$L32
	.word	$L32
	.word	$L32
	.word	$L32
	.word	$L32
	.word	$L32
	.word	$L32
	.word	$L32
	.word	$L32
	.word	$L32
	.word	$L28
	.word	$L27
	.word	$L25
	.word	$L32
	.word	$L32
	.word	$L32
	.word	$L32
	.word	$L32
	.word	$L32
	.word	$L32
	.word	$L32
	.word	$L32
	.word	$L32
	.word	$L32
	.word	$L32
	.word	$L32
	.word	$L32
	.word	$L26
	.text
$L25:
	lw	$v0,20($fp)
	sll	$v0,$v0,2
	addu	$v1,$fp,48
	addu	$v0,$v0,$v1
	lw	$v0,0($v0)
	sw	$v0,16($fp)
	la	$a0,$LC0
	lw	$a1,16($fp)
	jal	_printf
	j	$L32
$L26:
	lw	$v0,20($fp)
	sll	$v0,$v0,2
	addu	$v1,$fp,48
	addu	$v0,$v0,$v1
	lw	$v0,0($v0)
	sw	$v0,28($fp)
	la	$a0,$LC1
	lw	$a1,28($fp)
	jal	_printf
	j	$L32
$L27:
	lw	$v0,20($fp)
	sll	$v0,$v0,2
	addu	$v1,$fp,48
	addu	$v0,$v0,$v1
	lbu	$v0,0($v0)
	sb	$v0,24($fp)
	lb	$v0,24($fp)
	move	$a0,$v0
	jal	_print_char
	j	$L32
$L28:
	lw	$v0,20($fp)
	sll	$v0,$v0,2
	addu	$v1,$fp,48
	addu	$v0,$v0,$v1
	lw	$v0,0($v0)
	sw	$v0,28($fp)
	lw	$a0,28($fp)
	jal	_print_small_str
	j	$L32
$L29:
	lw	$v0,20($fp)
	sll	$v0,$v0,2
	addu	$v1,$fp,48
	addu	$v0,$v0,$v1
	lw	$v0,0($v0)
	sw	$v0,28($fp)
	lw	$a0,28($fp)
	jal	_print_big_str
	j	$L32
$L23:
	lw	$v0,48($fp)
	lb	$v0,0($v0)
	move	$a0,$v0
	jal	_print_char
$L32:
	lw	$v0,48($fp)
	addu	$v0,$v0,1
	sw	$v0,48($fp)
	j	$L20
$L21:
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
$L34:
	lw	$v0,40($fp)
	lb	$v0,0($v0)
	bne	$v0,$zero,$L36
	j	$L35
$L36:
	lw	$v0,40($fp)
	lb	$v1,0($v0)
	li	$v0,37			# 0x25
	bne	$v1,$v0,$L37
	lw	$v0,40($fp)
	addu	$v0,$v0,1
	sw	$v0,40($fp)
	lw	$v0,40($fp)
	lb	$v0,0($v0)
	sw	$v0,28($fp)
	li	$v0,100			# 0x64
	lw	$v1,28($fp)
	beq	$v1,$v0,$L39
	lw	$v1,28($fp)
	slt	$v0,$v1,101
	beq	$v0,$zero,$L44
	li	$v0,99			# 0x63
	lw	$v1,28($fp)
	beq	$v1,$v0,$L41
	j	$L37
$L44:
	li	$v0,115			# 0x73
	lw	$v1,28($fp)
	beq	$v1,$v0,$L40
	j	$L37
$L39:
	lw	$v0,44($fp)
	sw	$v0,16($fp)
	jal	_read_int
	move	$v1,$v0
	lw	$v0,16($fp)
	sw	$v1,0($v0)
	j	$L37
$L40:
	lw	$v0,44($fp)
	sw	$v0,24($fp)
	lw	$a0,24($fp)
	li	$a1,1025			# 0x401
	jal	_read_string
	j	$L37
$L41:
	lw	$v0,44($fp)
	sw	$v0,20($fp)
	jal	_read_char
	move	$v1,$v0
	lw	$v0,20($fp)
	sb	$v1,0($v0)
$L37:
	lw	$v0,40($fp)
	addu	$v0,$v0,1
	sw	$v0,40($fp)
	j	$L34
$L35:
	move	$sp,$fp
	lw	$ra,36($sp)
	lw	$fp,32($sp)
	addu	$sp,$sp,40
	j	$ra
	.rdata
	.align	2
$LC2:
	.asciiz	"Starting %b...\n"
	.align	2
$LC3:
	.asciiz	"CALCULATOR"
	.align	2
$LC4:
	.ascii	"Please select the calc mode. (\"+\" or \"-\" or \"*\" or"
	.ascii	" \"/\" or \"0\" or \"c\" or \"h\" or \"q\")\n"
	.asciiz	"Mode? : "
	.align	2
$LC5:
	.asciiz	"%c"
	.align	2
$LC6:
	.asciiz	"Do you want to reset calculation result? (y or N)\n"
	.align	2
$LC7:
	.asciiz	"Reset calculation result.\n\n"
	.align	2
$LC8:
	.asciiz	"Operation cancelled.\n\n"
	.align	2
$LC9:
	.asciiz	"Result : %d\n\n"
	.align	2
$LC10:
	.asciiz	"Cannot use history func before calculating once.\n\n"
	.align	2
$LC11:
	.asciiz	"Do you want to calc %c%d again? (y or N)\n"
	.align	2
$LC12:
	.asciiz	"Calculated %c%d again.\n"
	.align	2
$LC13:
	.asciiz	"Please select the correct mode.\n\n"
	.align	2
$LC14:
	.ascii	"Please input the number.(int type ONLY)\n"
	.asciiz	"Number? : "
	.align	2
$LC15:
	.ascii	"Cannot divide by zero.\n"
	.asciiz	"Operarion denied.\n"
	.align	2
$LC16:
	.asciiz	"%B : %d"
	.align	2
$LC17:
	.asciiz	"final result"
	.align	2
$LC18:
	.ascii	"\n"
	.asciiz	"Quit.\n"
	.text
	.align	2
main:
	subu	$sp,$sp,48
	sw	$ra,44($sp)
	sw	$fp,40($sp)
	move	$fp,$sp
	sw	$zero,16($fp)
	li	$v0,102			# 0x66
	sb	$v0,24($fp)
	li	$v0,-1			# 0xffffffff
	sw	$v0,28($fp)
	sw	$zero,36($fp)
	la	$a0,$LC2
	la	$a1,$LC3
	jal	_myprintf
$L48:
	la	$a0,$LC4
	lw	$a1,16($fp)
	jal	_myprintf
	addu	$v0,$fp,24
	la	$a0,$LC5
	move	$a1,$v0
	jal	_myscanf
	lb	$v1,24($fp)
	li	$v0,113			# 0x71
	bne	$v1,$v0,$L49
	j	$L47
$L49:
	lb	$v1,24($fp)
	li	$v0,48			# 0x30
	bne	$v1,$v0,$L50
	la	$a0,$LC6
	jal	_myprintf
	addu	$v0,$fp,25
	la	$a0,$LC5
	move	$a1,$v0
	jal	_myscanf
	lb	$v1,25($fp)
	li	$v0,121			# 0x79
	bne	$v1,$v0,$L51
	la	$a0,$LC7
	jal	_myprintf
	sw	$zero,16($fp)
	j	$L48
$L51:
	la	$a0,$LC8
	jal	_myprintf
	j	$L48
$L50:
	lb	$v1,24($fp)
	li	$v0,99			# 0x63
	bne	$v1,$v0,$L53
	la	$a0,$LC9
	lw	$a1,16($fp)
	jal	_myprintf
	j	$L48
$L53:
	lb	$v1,24($fp)
	li	$v0,104			# 0x68
	bne	$v1,$v0,$L54
	lw	$v1,28($fp)
	li	$v0,-1			# 0xffffffff
	bne	$v1,$v0,$L55
	la	$a0,$LC10
	jal	_myprintf
	j	$L48
$L55:
	lb	$v0,32($fp)
	la	$a0,$LC11
	move	$a1,$v0
	lw	$a2,36($fp)
	jal	_myprintf
	addu	$v0,$fp,25
	la	$a0,$LC5
	move	$a1,$v0
	jal	_myscanf
	lb	$v1,25($fp)
	li	$v0,121			# 0x79
	bne	$v1,$v0,$L56
	lb	$v0,32($fp)
	la	$a0,$LC12
	move	$a1,$v0
	lw	$a2,36($fp)
	jal	_myprintf
	lbu	$v0,32($fp)
	sb	$v0,24($fp)
	lw	$v0,36($fp)
	sw	$v0,20($fp)
	li	$v0,1			# 0x1
	sw	$v0,28($fp)
	j	$L54
$L56:
	la	$a0,$LC8
	jal	_myprintf
	j	$L48
$L54:
	lb	$v1,24($fp)
	li	$v0,43			# 0x2b
	beq	$v1,$v0,$L58
	lb	$v1,24($fp)
	li	$v0,45			# 0x2d
	beq	$v1,$v0,$L58
	lb	$v1,24($fp)
	li	$v0,42			# 0x2a
	beq	$v1,$v0,$L58
	lb	$v1,24($fp)
	li	$v0,47			# 0x2f
	beq	$v1,$v0,$L58
	la	$a0,$LC13
	jal	_myprintf
	j	$L48
$L58:
	lw	$v0,28($fp)
	bgtz	$v0,$L59
	la	$a0,$LC14
	jal	_myprintf
	addu	$v0,$fp,20
	la	$a0,$LC0
	move	$a1,$v0
	jal	_myscanf
$L59:
	lbu	$v0,24($fp)
	sb	$v0,32($fp)
	lw	$v0,20($fp)
	sw	$v0,36($fp)
	lb	$v1,24($fp)
	li	$v0,43			# 0x2b
	bne	$v1,$v0,$L60
	lw	$v0,16($fp)
	lw	$v1,20($fp)
	addu	$v0,$v0,$v1
	sw	$v0,16($fp)
$L60:
	lb	$v1,24($fp)
	li	$v0,45			# 0x2d
	bne	$v1,$v0,$L61
	lw	$v0,16($fp)
	lw	$v1,20($fp)
	subu	$v0,$v0,$v1
	sw	$v0,16($fp)
$L61:
	lb	$v1,24($fp)
	li	$v0,42			# 0x2a
	bne	$v1,$v0,$L62
	lw	$v0,16($fp)
	lw	$v1,20($fp)
	mult	$v0,$v1
	mflo	$v0
	sw	$v0,16($fp)
$L62:
	lb	$v1,24($fp)
	li	$v0,47			# 0x2f
	bne	$v1,$v0,$L63
	lw	$v0,20($fp)
	beq	$v0,$zero,$L64
	lw	$v0,16($fp)
	lw	$v1,20($fp)
	div	$0,$v0,$v1
	mflo	$v0
	sw	$v0,16($fp)
	j	$L63
$L64:
	la	$a0,$LC15
	jal	_myprintf
$L63:
	la	$a0,$LC9
	lw	$a1,16($fp)
	jal	_myprintf
	sw	$zero,28($fp)
	j	$L48
$L47:
	la	$a0,$LC16
	la	$a1,$LC17
	lw	$a2,16($fp)
	jal	_myprintf
	la	$a0,$LC18
	jal	_myprintf
	move	$v0,$zero
	move	$sp,$fp
	lw	$ra,44($sp)
	lw	$fp,40($sp)
	addu	$sp,$sp,48
	j	$ra
