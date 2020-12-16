	.file	"hanoi.c"
	.section	.rodata
.LC0:
	.string	"Move disk "
.LC1:
	.string	" from peg "
.LC2:
	.string	" to peg "
.LC3:
	.string	".\n"
	.text
	.globl	hanoi
	.type	hanoi, @function
hanoi:
.LFB0:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	cmpl	$0, 8(%ebp)
	je	.L1
	movl	8(%ebp), %eax
	leal	-1(%eax), %edx
	movl	16(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	20(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	hanoi
	movl	$.LC0, (%esp)
	call	print_string
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	print_int
	movl	$.LC1, (%esp)
	call	print_string
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	print_int
	movl	$.LC2, (%esp)
	call	print_string
	movl	16(%ebp), %eax
	movl	%eax, (%esp)
	call	print_int
	movl	$.LC3, (%esp)
	call	print_string
	movl	8(%ebp), %eax
	leal	-1(%eax), %edx
	movl	12(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	20(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	hanoi
.L1:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	hanoi, .-hanoi
	.section	.rodata
.LC4:
	.string	"Enter number of disks> "
	.text
	.globl	main
	.type	main, @function
main:
.LFB1:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	andl	$-16, %esp
	subl	$32, %esp
	movl	$.LC4, (%esp)
	call	print_string
	call	read_int
	movl	%eax, 28(%esp)
	movl	$3, 12(%esp)
	movl	$2, 8(%esp)
	movl	$1, 4(%esp)
	movl	28(%esp), %eax
	movl	%eax, (%esp)
	call	hanoi
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.ident	"GCC: (GNU) 4.8.5 20150623 (Red Hat 4.8.5-44)"
	.section	.note.GNU-stack,"",@progbits
