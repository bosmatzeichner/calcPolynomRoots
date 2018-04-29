	.file	"calcFunctions.c"
	.intel_syntax noprefix
	.text
	.globl	calcRoot
	.type	calcRoot, @function
calcRoot:
.LFB2:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 96
	mov	QWORD PTR [rbp-56], rdi
	mov	QWORD PTR [rbp-64], rsi
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR [rbp-8], rax
	xor	eax, eax
	mov	rax, QWORD PTR [rbp-64]
	mov	edx, DWORD PTR [rax]
	mov	rax, QWORD PTR [rbp-64]
	mov	rax, QWORD PTR [rax+8]
	mov	esi, edx
	mov	rdi, rax
	call	prepare_deriv_coeffs
	mov	rdx, rax
	mov	rax, QWORD PTR [rbp-64]
	mov	QWORD PTR [rax+16], rdx
	mov	rax, QWORD PTR [rbp-64]
	mov	edx, DWORD PTR [rax]
	mov	rax, QWORD PTR [rbp-64]
	mov	rcx, QWORD PTR [rax+8]
	lea	rax, [rbp-48]
	push	QWORD PTR [rbp+40]
	push	QWORD PTR [rbp+32]
	push	QWORD PTR [rbp+24]
	push	QWORD PTR [rbp+16]
	mov	rsi, rcx
	mov	rdi, rax
	call	eval_poly
	add	rsp, 32
	jmp	.L2
.L3:
	mov	rax, QWORD PTR [rbp-64]
	push	QWORD PTR [rbp+40]
	push	QWORD PTR [rbp+32]
	push	QWORD PTR [rbp+24]
	push	QWORD PTR [rbp+16]
	mov	rsi, rax
	lea	rdi, [rbp+16]
	call	eval_next_seq_element
	add	rsp, 32
	mov	rax, QWORD PTR [rbp-64]
	mov	edx, DWORD PTR [rax]
	mov	rax, QWORD PTR [rbp-64]
	mov	rcx, QWORD PTR [rax+8]
	lea	rax, [rbp-96]
	push	QWORD PTR [rbp+40]
	push	QWORD PTR [rbp+32]
	push	QWORD PTR [rbp+24]
	push	QWORD PTR [rbp+16]
	mov	rsi, rcx
	mov	rdi, rax
	call	eval_poly
	add	rsp, 32
	mov	rax, QWORD PTR [rbp-96]
	mov	QWORD PTR [rbp-48], rax
	mov	rax, QWORD PTR [rbp-88]
	mov	QWORD PTR [rbp-40], rax
	mov	rax, QWORD PTR [rbp-80]
	mov	QWORD PTR [rbp-32], rax
	mov	rax, QWORD PTR [rbp-72]
	mov	QWORD PTR [rbp-24], rax
.L2:
	push	QWORD PTR [rbp+56]
	push	QWORD PTR [rbp+48]
	push	QWORD PTR [rbp-24]
	push	QWORD PTR [rbp-32]
	push	QWORD PTR [rbp-40]
	push	QWORD PTR [rbp-48]
	call	sqrtNorm_bigger_then_tolerance
	add	rsp, 48
	test	eax, eax
	jne	.L3
	mov	rax, QWORD PTR [rbp-64]
	mov	rax, QWORD PTR [rax+16]
	mov	rdi, rax
	call	free
	mov	rax, QWORD PTR [rbp-56]
	mov	rdx, QWORD PTR [rbp+16]
	mov	QWORD PTR [rax], rdx
	mov	rdx, QWORD PTR [rbp+24]
	mov	QWORD PTR [rax+8], rdx
	mov	rdx, QWORD PTR [rbp+32]
	mov	QWORD PTR [rax+16], rdx
	mov	rdx, QWORD PTR [rbp+40]
	mov	QWORD PTR [rax+24], rdx
	mov	rax, QWORD PTR [rbp-56]
	mov	rcx, QWORD PTR [rbp-8]
	xor	rcx, QWORD PTR fs:40
	je	.L5
	call	__stack_chk_fail
.L5:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	calcRoot, .-calcRoot
	.globl	eval_next_seq_element
	.type	eval_next_seq_element, @function
eval_next_seq_element:
.LFB3:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	add	rsp, -128
	mov	QWORD PTR [rbp-120], rdi
	mov	QWORD PTR [rbp-128], rsi
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR [rbp-8], rax
	xor	eax, eax
	mov	rax, QWORD PTR [rbp-128]
	mov	edx, DWORD PTR [rax]
	mov	rax, QWORD PTR [rbp-128]
	mov	rcx, QWORD PTR [rax+8]
	lea	rax, [rbp-112]
	push	QWORD PTR [rbp+40]
	push	QWORD PTR [rbp+32]
	push	QWORD PTR [rbp+24]calcRoot:
.LFB2:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 96
	mov	QWORD PTR [rbp-56], rdi
	mov	QWORD PTR [rbp-64], rsi
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR [rbp-8], rax
	xor	eax, eax
	mov	rax, QWORD PTR [rbp-64]
	mov	edx, DWORD PTR [rax]
	mov	rax, QWORD PTR [rbp-64]
	mov	rax, QWORD PTR [rax+8]
	mov	esi, edx
	mov	rdi, rax
	call	prepare_deriv_coeffs
	mov	rdx, rax
	mov	rax, QWORD PTR [rbp-64]
	mov	QWORD PTR [rax+16], rdx
	mov	rax, QWORD PTR [rbp-64]
	mov	edx, DWORD PTR [rax]
	mov	rax, QWORD PTR [rbp-64]
	mov	rcx, QWORD PTR [rax+8]
	lea	rax, [rbp-48]
	push	QWORD PTR [rbp+40]
	push	QWORD PTR [rbp+32]
	push	QWORD PTR [rbp+24]
	push	QWORD PTR [rbp+16]
	mov	rsi, rcx
	mov	rdi, rax
	call	eval_poly
	add	rsp, 32
	jmp	.L2
.L3:
	mov	rax, QWORD PTR [rbp-64]
	push	QWORD PTR [rbp+40]
	push	QWORD PTR [rbp+32]
	push	QWORD PTR [rbp+24]
	push	QWORD PTR [rbp+16]
	mov	rsi, rax
	lea	rdi, [rbp+16]
	call	eval_next_seq_element
	add	rsp, 32
	push	QWORD PTR [rbp+16]
	mov	rsi, rcx
	mov	rdi, rax
	call	eval_poly
	add	rsp, 32
	mov	rax, QWORD PTR [rbp-128]
	mov	eax, DWORD PTR [rax]
	lea	edx, [rax-1]
	mov	rax, QWORD PTR [rbp-128]
	mov	rcx, QWORD PTR [rax+16]
	lea	rax, [rbp-80]
	push	QWORD PTR [rbp+40]
	push	QWORD PTR [rbp+32]
	push	QWORD PTR [rbp+24]
	push	QWORD PTR [rbp+16]
	mov	rsi, rcx
	mov	rdi, rax
	call	eval_poly
	add	rsp, 32
	lea	rax, [rbp-48]
	push	QWORD PTR [rbp-56]
	push	QWORD PTR [rbp-64]
	push	QWORD PTR [rbp-72]
	push	QWORD PTR [rbp-80]
	push	QWORD PTR [rbp-88]
	push	QWORD PTR [rbp-96]
	push	QWORD PTR [rbp-104]
	push	QWORD PTR [rbp-112]
	push	QWORD PTR [rbp+40]
	push	QWORD PTR [rbp+32]
	push	QWORD PTR [rbp+24]
	push	QWORD PTR [rbp+16]
	mov	rdi, rax
	call	eval_element
	add	rsp, 96
	mov	rax, QWORD PTR [rbp-120]
	mov	rdx, QWORD PTR [rbp-48]
	mov	QWORD PTR [rax], rdx
	mov	rdx, QWORD PTR [rbp-40]
	mov	QWORD PTR [rax+8], rdx
	mov	rdx, QWORD PTR [rbp-32]
	mov	QWORD PTR [rax+16], rdx
	mov	rdx, QWORD PTR [rbp-24]
	mov	QWORD PTR [rax+24], rdx
	mov	rax, QWORD PTR [rbp-120]
	mov	rsi, QWORD PTR [rbp-8]
	xor	rsi, QWORD PTR fs:40
	je	.L8
	call	__stack_chk_fail
.L8:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	eval_next_seq_element, .-eval_next_seq_element
	.globl	sqrtNorm_bigger_then_tolerance
	.type	sqrtNorm_bigger_then_tolerance, @function
sqrtNorm_bigger_then_tolerance:
.LFB4:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 48
	push	QWORD PTR [rbp+40]
	push	QWORD PTR [rbp+32]
	push	QWORD PTR [rbp+24]
	push	QWORD PTR [rbp+16]
	call	eval_euclidean_sqrt_norm
	add	rsp, 32
	fstp	TBYTE PTR [rbp-48]
	mov	rax, QWORD PTR [rbp-48]
	mov	edx, DWORD PTR [rbp-40]
	mov	QWORD PTR [rbp-16], rax
	mov	DWORD PTR [rbp-8], edx
	fld	TBYTE PTR [rbp+48]
	fld	TBYTE PTR [rbp+48]
	fmulp	st(1), st
	fld	TBYTE PTR [rbp-16]
	fucomip	st, st(1)
	fstp	st(0)
	setnb	al
	movzx	eax, al
	mov	DWORD PTR [rbp-20], eax
	mov	eax, DWORD PTR [rbp-20]
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	sqrtNorm_bigger_then_tolerance, .-sqrtNorm_bigger_then_tolerance
	.globl	eval_euclidean_sqrt_norm
	.type	eval_euclidean_sqrt_norm, @function
eval_euclidean_sqrt_norm:
.LFB5:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	fld	TBYTE PTR [rbp+16]
	fld	TBYTE PTR [rbp+16]
	fmulp	st(1), st
	fld	TBYTE PTR [rbp+32]
	fld	TBYTE PTR [rbp+32]
	fmulp	st(1), st
	faddp	st(1), st
	fstp	TBYTE PTR [rbp-16]
	fld	TBYTE PTR [rbp-16]
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	eval_euclidean_sqrt_norm, .-eval_euclidean_sqrt_norm
	.globl	cmplx_add
	.type	cmplx_add, @function
cmplx_add:
.LFB6:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	mov	QWORD PTR [rbp-40], rdi
	fldz
	fstp	TBYTE PTR [rbp-32]
	fldz
	fstp	TBYTE PTR [rbp-16]
	fld	TBYTE PTR [rbp+16]
	fld	TBYTE PTR [rbp+48]
	faddp	st(1), st
	fstp	TBYTE PTR [rbp-32]
	fld	TBYTE PTR [rbp+32]
	fld	TBYTE PTR [rbp+64]
	faddp	st(1), st
	fstp	TBYTE PTR [rbp-16]
	mov	rax, QWORD PTR [rbp-40]
	mov	rdx, QWORD PTR [rbp-32]
	mov	QWORD PTR [rax], rdx
	mov	rdx, QWORD PTR [rbp-24]
	mov	QWORD PTR [rax+8], rdx
	mov	rdx, QWORD PTR [rbp-16]
	mov	QWORD PTR [rax+16], rdx
	mov	rdx, QWORD PTR [rbp-8]
	mov	QWORD PTR [rax+24], rdx
	mov	rax, QWORD PTR [rbp-40]
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	cmplx_add, .-cmplx_add
	.globl	cmplx_sub
	.type	cmplx_sub, @function
cmplx_sub:
.LFB7:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	mov	QWORD PTR [rbp-40], rdi
	fldz
	fstp	TBYTE PTR [rbp-32]
	fldz
	fstp	TBYTE PTR [rbp-16]
	fld	TBYTE PTR [rbp+16]
	fld	TBYTE PTR [rbp+48]
	fsubp	st(1), st
	fstp	TBYTE PTR [rbp-32]
	fld	TBYTE PTR [rbp+32]
	fld	TBYTE PTR [rbp+64]
	fsubp	st(1), st
	fstp	TBYTE PTR [rbp-16]
	mov	rax, QWORD PTR [rbp-40]
	mov	rdx, QWORD PTR [rbp-32]
	mov	QWORD PTR [rax], rdx
	mov	rdx, QWORD PTR [rbp-24]
	mov	QWORD PTR [rax+8], rdx
	mov	rdx, QWORD PTR [rbp-16]
	mov	QWORD PTR [rax+16], rdx
	mov	rdx, QWORD PTR [rbp-8]
	mov	QWORD PTR [rax+24], rdx
	mov	rax, QWORD PTR [rbp-40]
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	cmplx_sub, .-cmplx_sub
	.globl	cmplx_mul
	.type	cmplx_mul, @function
cmplx_mul:
.LFB8:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	mov	QWORD PTR [rbp-40], rdi
	fldz
	fstp	TBYTE PTR [rbp-32]
	fldz
	fstp	TBYTE PTR [rbp-16]
	fld	TBYTE PTR [rbp+16]
	fld	TBYTE PTR [rbp+48]
	fmulp	st(1), st
	fld	TBYTE PTR [rbp+32]
	fld	TBYTE PTR [rbp+64]
	fmulp	st(1), st
	fsubp	st(1), st
	fstp	TBYTE PTR [rbp-32]
	fld	TBYTE PTR [rbp+16]
	fld	TBYTE PTR [rbp+64]
	fmulp	st(1), st
	fld	TBYTE PTR [rbp+48]
	fld	TBYTE PTR [rbp+32]
	fmulp	st(1), st
	faddp	st(1), st
	fstp	TBYTE PTR [rbp-16]
	mov	rax, QWORD PTR [rbp-40]
	mov	rdx, QWORD PTR [rbp-32]
	mov	QWORD PTR [rax], rdx
	mov	rdx, QWORD PTR [rbp-24]
	mov	QWORD PTR [rax+8], rdx
	mov	rdx, QWORD PTR [rbp-16]
	mov	QWORD PTR [rax+16], rdx
	mov	rdx, QWORD PTR [rbp-8]
	mov	QWORD PTR [rax+24], rdx
	mov	rax, QWORD PTR [rbp-40]
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	cmplx_mul, .-cmplx_mul
	.globl	cmplx_div
	.type	cmplx_div, @function
cmplx_div:
.LFB9:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	mov	QWORD PTR [rbp-56], rdi
	fldz
	fstp	TBYTE PTR [rbp-32]
	fldz
	fstp	TBYTE PTR [rbp-16]
	fld	TBYTE PTR [rbp+48]
	fld	TBYTE PTR [rbp+48]
	fmulp	st(1), st
	fld	TBYTE PTR [rbp+64]
	fld	TBYTE PTR [rbp+64]
	fmulp	st(1), st
	faddp	st(1), st
	fstp	TBYTE PTR [rbp-48]
	fld	TBYTE PTR [rbp+16]
	fld	TBYTE PTR [rbp+48]
	fmulp	st(1), st
	fld	TBYTE PTR [rbp+32]
	fld	TBYTE PTR [rbp+64]
	fmulp	st(1), st
	fsubp	st(1), st
	fld	TBYTE PTR [rbp-48]
	fdivp	st(1), st
	fstp	TBYTE PTR [rbp-32]
	fld	TBYTE PTR [rbp+32]
	fld	TBYTE PTR [rbp+48]
	fmulp	st(1), st
	fld	TBYTE PTR [rbp+16]
	fld	TBYTE PTR [rbp+64]
	fmulp	st(1), st
	fsubp	st(1), st
	fld	TBYTE PTR [rbp-48]
	fdivp	st(1), st
	fstp	TBYTE PTR [rbp-16]
	mov	rax, QWORD PTR [rbp-56]
	mov	rdx, QWORD PTR [rbp-32]
	mov	QWORD PTR [rax], rdx
	mov	rdx, QWORD PTR [rbp-24]
	mov	QWORD PTR [rax+8], rdx
	mov	rdx, QWORD PTR [rbp-16]
	mov	QWORD PTR [rax+16], rdx
	mov	rdx, QWORD PTR [rbp-8]
	mov	QWORD PTR [rax+24], rdx
	mov	rax, QWORD PTR [rbp-56]
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	cmplx_div, .-cmplx_div
	.globl	cmplx_mul_add
	.type	cmplx_mul_add, @function
cmplx_mul_add:
.LFB10:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 96
	mov	QWORD PTR [rbp-56], rdi
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR [rbp-8], rax
	xor	eax, eax
	lea	rax, [rbp-48]
	push	QWORD PTR [rbp+72]
	push	QWORD PTR [rbp+64]
	push	QWORD PTR [rbp+56]
	push	QWORD PTR [rbp+48]
	push	QWORD PTR [rbp+40]
	push	QWORD PTR [rbp+32]
	push	QWORD PTR [rbp+24]
	push	QWORD PTR [rbp+16]
	mov	rdi, rax
	call	cmplx_mul
	add	rsp, 64
	lea	rax, [rbp-96]
	push	QWORD PTR [rbp+104]
	push	QWORD PTR [rbp+96]
	push	QWORD PTR [rbp+88]
	push	QWORD PTR [rbp+80]
	push	QWORD PTR [rbp-24]
	push	QWORD PTR [rbp-32]
	push	QWORD PTR [rbp-40]
	push	QWORD PTR [rbp-48]
	mov	rdi, rax
	call	cmplx_add
	add	rsp, 64
	mov	rax, QWORD PTR [rbp-96]
	mov	QWORD PTR [rbp-48], rax
	mov	rax, QWORD PTR [rbp-88]
	mov	QWORD PTR [rbp-40], rax
	mov	rax, QWORD PTR [rbp-80]
	mov	QWORD PTR [rbp-32], rax
	mov	rax, QWORD PTR [rbp-72]
	mov	QWORD PTR [rbp-24], rax
	mov	rax, QWORD PTR [rbp-56]
	mov	rdx, QWORD PTR [rbp-48]
	mov	QWORD PTR [rax], rdx
	mov	rdx, QWORD PTR [rbp-40]
	mov	QWORD PTR [rax+8], rdx
	mov	rdx, QWORD PTR [rbp-32]
	mov	QWORD PTR [rax+16], rdx
	mov	rdx, QWORD PTR [rbp-24]
	mov	QWORD PTR [rax+24], rdx
	mov	rax, QWORD PTR [rbp-56]
	mov	rcx, QWORD PTR [rbp-8]
	xor	rcx, QWORD PTR fs:40
	je	.L23
	call	__stack_chk_fail
.L23:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	cmplx_mul_add, .-cmplx_mul_add
	.globl	eval_element
	.type	eval_element, @function
eval_element:
.LFB11:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 96
	mov	QWORD PTR [rbp-88], rdi
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR [rbp-8], rax
	xor	eax, eax
	lea	rax, [rbp-80]
	push	QWORD PTR [rbp+104]
	push	QWORD PTR [rbp+96]
	push	QWORD PTR [rbp+88]
	push	QWORD PTR [rbp+80]
	push	QWORD PTR [rbp+72]
	push	QWORD PTR [rbp+64]
	push	QWORD PTR [rbp+56]
	push	QWORD PTR [rbp+48]
	mov	rdi, rax
	call	cmplx_div
	add	rsp, 64
	lea	rax, [rbp-48]
	push	QWORD PTR [rbp-56]
	push	QWORD PTR [rbp-64]
	push	QWORD PTR [rbp-72]
	push	QWORD PTR [rbp-80]
	push	QWORD PTR [rbp+40]
	push	QWORD PTR [rbp+32]
	push	QWORD PTR [rbp+24]
	push	QWORD PTR [rbp+16]
	mov	rdi, rax
	call	cmplx_sub
	add	rsp, 64
	mov	rax, QWORD PTR [rbp-88]
	mov	rdx, QWORD PTR [rbp-48]
	mov	QWORD PTR [rax], rdx
	mov	rdx, QWORD PTR [rbp-40]
	mov	QWORD PTR [rax+8], rdx
	mov	rdx, QWORD PTR [rbp-32]
	mov	QWORD PTR [rax+16], rdx
	mov	rdx, QWORD PTR [rbp-24]
	mov	QWORD PTR [rax+24], rdx
	mov	rax, QWORD PTR [rbp-88]
	mov	rcx, QWORD PTR [rbp-8]
	xor	rcx, QWORD PTR fs:40
	je	.L26
	call	__stack_chk_fail
.L26:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	eval_element, .-eval_element
	.globl	eval_poly
	.type	eval_poly, @function
eval_poly:
.LFB12:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 96
	mov	QWORD PTR [rbp-72], rdi
	mov	QWORD PTR [rbp-80], rsi
	mov	DWORD PTR [rbp-84], edx
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR [rbp-8], rax
	xor	eax, eax
	fldz
	fstp	TBYTE PTR [rbp-48]
	fldz
	fstp	TBYTE PTR [rbp-32]
	fldz
	fstp	TBYTE PTR [rbp-48]
	fldz
	fstp	TBYTE PTR [rbp-32]
	mov	eax, DWORD PTR [rbp-84]
	mov	DWORD PTR [rbp-52], eax
	jmp	.L28
.L29:
	mov	eax, DWORD PTR [rbp-52]
	cdqe
	sal	rax, 5
	mov	rdx, rax
	mov	rax, QWORD PTR [rbp-80]
	add	rax, rdx
	lea	rdx, [rbp-48]
	push	QWORD PTR [rax+24]
	push	QWORD PTR [rax+16]
	push	QWORD PTR [rax+8]
	push	QWORD PTR [rax]
	push	QWORD PTR [rbp+40]
	push	QWORD PTR [rbp+32]
	push	QWORD PTR [rbp+24]
	push	QWORD PTR [rbp+16]
	push	QWORD PTR [rbp-24]
	push	QWORD PTR [rbp-32]
	push	QWORD PTR [rbp-40]
	push	QWORD PTR [rbp-48]
	mov	rdi, rdx
	call	cmplx_mul_add
	add	rsp, 96
	sub	DWORD PTR [rbp-52], 1
.L28:
	cmp	DWORD PTR [rbp-52], 0
	jns	.L29
	mov	rax, QWORD PTR [rbp-72]
	mov	rdx, QWORD PTR [rbp-48]
	mov	QWORD PTR [rax], rdx
	mov	rdx, QWORD PTR [rbp-40]
	mov	QWORD PTR [rax+8], rdx
	mov	rdx, QWORD PTR [rbp-32]
	mov	QWORD PTR [rax+16], rdx
	mov	rdx, QWORD PTR [rbp-24]
	mov	QWORD PTR [rax+24], rdx
	mov	rax, QWORD PTR [rbp-72]
	mov	rcx, QWORD PTR [rbp-8]
	xor	rcx, QWORD PTR fs:40
	je	.L31
	call	__stack_chk_fail
.L31:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	eval_poly, .-eval_poly
	.globl	prepare_deriv_coeffs
	.type	prepare_deriv_coeffs, @function
prepare_deriv_coeffs:
.LFB13:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 32
	mov	QWORD PTR [rbp-24], rdi
	mov	DWORD PTR [rbp-28], esi
	mov	eax, DWORD PTR [rbp-28]
	add	eax, 1
	cdqe
	mov	esi, 32
	mov	rdi, rax
	call	calloc
	mov	QWORD PTR [rbp-8], rax
	mov	eax, DWORD PTR [rbp-28]
	mov	DWORD PTR [rbp-12], eax
	jmp	.L33
.L34:
	mov	eax, DWORD PTR [rbp-12]
	cdqe
	sal	rax, 5
	lea	rdx, [rax-32]
	mov	rax, QWORD PTR [rbp-8]
	add	rax, rdx
	mov	edx, DWORD PTR [rbp-12]
	movsx	rdx, edx
	mov	rcx, rdx
	sal	rcx, 5
	mov	rdx, QWORD PTR [rbp-24]
	add	rdx, rcx
	fld	TBYTE PTR [rdx]
	fild	DWORD PTR [rbp-12]
	fmulp	st(1), st
	fstp	TBYTE PTR [rax]
	mov	eax, DWORD PTR [rbp-12]
	cdqe
	sal	rax, 5
	lea	rdx, [rax-32]
	mov	rax, QWORD PTR [rbp-8]
	add	rax, rdx
	mov	edx, DWORD PTR [rbp-12]
	movsx	rdx, edx
	mov	rcx, rdx
	sal	rcx, 5
	mov	rdx, QWORD PTR [rbp-24]
	add	rdx, rcx
	fld	TBYTE PTR [rdx+16]
	fstp	TBYTE PTR [rax+16]
	sub	DWORD PTR [rbp-12], 1
.L33:
	cmp	DWORD PTR [rbp-12], 0
	jg	.L34
	mov	rax, QWORD PTR [rbp-8]
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE13:
	.size	prepare_deriv_coeffs, .-prepare_deriv_coeffs
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.9) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
