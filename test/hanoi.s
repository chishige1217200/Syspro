	.file	1 "hanoi.c"
	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	fp=xx
	.module	nooddspreg
	.abicalls
	.text
	.rdata
	.align	2
$LC0:
	.ascii	"Move disk \000"
	.align	2
$LC1:
	.ascii	" from peg \000"
	.align	2
$LC2:
	.ascii	" to peg \000"
	.align	2
$LC3:
	.ascii	".\012\000"
	.text
	.align	2
	.globl	hanoi
	.set	nomips16
	.set	nomicromips
	.ent	hanoi
	.type	hanoi, @function
hanoi:
	.frame	$fp,32,$31		# vars= 0, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-32
	sw	$31,28($sp)
	sw	$fp,24($sp)
	move	$fp,$sp
	lui	$28,%hi(__gnu_local_gp)
	addiu	$28,$28,%lo(__gnu_local_gp)
	.cprestore	16
	sw	$4,32($fp)
	sw	$5,36($fp)
	sw	$6,40($fp)
	sw	$7,44($fp)
	lw	$2,32($fp)
	beq	$2,$0,$L3
	nop

	lw	$2,32($fp)
	addiu	$2,$2,-1
	lw	$7,40($fp)
	lw	$6,44($fp)
	lw	$5,36($fp)
	move	$4,$2
	.option	pic0
	jal	hanoi
	nop

	.option	pic2
	lw	$28,16($fp)
	lui	$2,%hi($LC0)
	addiu	$4,$2,%lo($LC0)
	lw	$2,%call16(print_string)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,print_string
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lw	$4,32($fp)
	lw	$2,%call16(print_int)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,print_int
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lui	$2,%hi($LC1)
	addiu	$4,$2,%lo($LC1)
	lw	$2,%call16(print_string)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,print_string
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lw	$4,36($fp)
	lw	$2,%call16(print_int)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,print_int
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lui	$2,%hi($LC2)
	addiu	$4,$2,%lo($LC2)
	lw	$2,%call16(print_string)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,print_string
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lw	$4,40($fp)
	lw	$2,%call16(print_int)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,print_int
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lui	$2,%hi($LC3)
	addiu	$4,$2,%lo($LC3)
	lw	$2,%call16(print_string)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,print_string
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lw	$2,32($fp)
	addiu	$2,$2,-1
	lw	$7,36($fp)
	lw	$6,40($fp)
	lw	$5,44($fp)
	move	$4,$2
	.option	pic0
	jal	hanoi
	nop

	.option	pic2
	lw	$28,16($fp)
$L3:
	nop
	move	$sp,$fp
	lw	$31,28($sp)
	lw	$fp,24($sp)
	addiu	$sp,$sp,32
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	hanoi
	.size	hanoi, .-hanoi
	.rdata
	.align	2
$LC4:
	.ascii	"Enter number of disks> \000"
	.text
	.align	2
	.globl	main
	.set	nomips16
	.set	nomicromips
	.ent	main
	.type	main, @function
main:
	.frame	$fp,40,$31		# vars= 8, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-40
	sw	$31,36($sp)
	sw	$fp,32($sp)
	move	$fp,$sp
	lui	$28,%hi(__gnu_local_gp)
	addiu	$28,$28,%lo(__gnu_local_gp)
	.cprestore	16
	lui	$2,%hi($LC4)
	addiu	$4,$2,%lo($LC4)
	lw	$2,%call16(print_string)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,print_string
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lw	$2,%call16(read_int)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,read_int
1:	jalr	$25
	nop

	lw	$28,16($fp)
	sw	$2,28($fp)
	li	$7,3			# 0x3
	li	$6,2			# 0x2
	li	$5,1			# 0x1
	lw	$4,28($fp)
	.option	pic0
	jal	hanoi
	nop

	.option	pic2
	lw	$28,16($fp)
	move	$2,$0
	move	$sp,$fp
	lw	$31,36($sp)
	lw	$fp,32($sp)
	addiu	$sp,$sp,40
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main
	.ident	"GCC: (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0"
