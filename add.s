
section .text
    global cmplx_add
    global cmplx_sub
    global cmplx_mul
    global cmplx_div
    global calcRoot
    global eval_next_seq_element
    global sqrtNorm_bigger_then_tolerance
    global eval_euclidean_sqrt_norm
    global cmplx_mul_add
    global eval_element
    global eval_poly
    global prepare_deriv_coeffs

cmplx_add:
    push rbp
    mov rbp, rsp
    mov QWORD  [rbp-40], rdi
    fldz
    fstp TWORD  [rbp-32]
    fldz
    fstp TWORD  [rbp-16]
    fld TWORD  [rbp+16]
    fld TWORD  [rbp+48]
    faddp st1, st0
    fstp TWORD  [rbp-32]
    fld TWORD  [rbp+32]
    fld TWORD  [rbp+64]
    faddp st1, st0
    fstp TWORD  [rbp-16]
    mov rax, QWORD  [rbp-40]
    mov rdx, QWORD  [rbp-32]
    mov QWORD  [rax], rdx
    mov rdx, QWORD  [rbp-24]
    mov QWORD  [rax+8], rdx
    mov rdx, QWORD  [rbp-16]
    mov QWORD  [rax+16], rdx
    mov rdx, QWORD  [rbp-8]
    mov QWORD  [rax+24], rdx
    mov rax, QWORD  [rbp-40]
    pop rbp
    ret

cmplx_mul:
push rbp
	mov	rbp, rsp
	mov	QWORD [rbp-40], rdi
	fldz
	fstp TWORD [rbp-32]
	fldz
	fstp TWORD [rbp-16]
	fld	TWORD [rbp+16]
	fld	TWORD[rbp+48]
	fmulp st1, st0
	fld	TWORD [rbp+32]
	fld	TWORD [rbp+64]
	fmulp st1, st0
	fsubp st1, st0
	fstp TWORD [rbp-32]
	fld	TWORD [rbp+16]
	fld	TWORD [rbp+64]
	fmulp	st1, st0
	fld	TWORD [rbp+48]
	fld	TWORD [rbp+32]
	fmulp st1, st0
	faddp st1, st0
	fstp TWORD [rbp-16]
	mov	rax, QWORD [rbp-40]
	mov	rdx, QWORD [rbp-32]
	mov	QWORD [rax], rdx
	mov	rdx, QWORD [rbp-24]
	mov	QWORD [rax+8], rdx
	mov	rdx, QWORD [rbp-16]
	mov	QWORD [rax+16], rdx
	mov	rdx, QWORD [rbp-8]
	mov	QWORD [rax+24], rdx
	mov	rax, QWORD [rbp-40]
	pop	rbp
	ret

cmplx_div:
	push rbp
	mov	rbp, rsp
	mov	QWORD [rbp-56], rdi
	fldz
	fstp TWORD [rbp-32]
	fldz
	fstp TWORD [rbp-16]
	fld TWORD [rbp+48]
	fld TWORD [rbp+48]
	fmulp st1, st0
	fld TWORD [rbp+64]
	fld TWORD [rbp+64]
	fmulp st1, st0
	faddp st1, st0
	fstp TWORD [rbp-48]
	fld TWORD [rbp+16]
	fld TWORD [rbp+48]
	fmulp st1, st0
	fld TWORD [rbp+32]
	fld TWORD [rbp+64]
	fmulp st1, st0
	fsubp st1, st0
	fld	TWORD [rbp-48]
	fdivp st1, st0
	fstp TWORD [rbp-32]
	fld TWORD [rbp+32]
	fld TWORD [rbp+48]
	fmulp st1, st0
	fld TWORD [rbp+16]
	fld TWORD [rbp+64]
	fmulp st1, st0
	fsubp st1, st0
	fld TWORD [rbp-48]
	fdivp st1, st0
	fstp TWORD [rbp-16]
	mov	rax, QWORD [rbp-56]
	mov	rdx, QWORD [rbp-32]
	mov	QWORD [rax], rdx
	mov	rdx, QWORD [rbp-24]
	mov	QWORD [rax+8], rdx
	mov	rdx, QWORD [rbp-16]
	mov	QWORD [rax+16], rdx
	mov	rdx, QWORD [rbp-8]
	mov	QWORD [rax+24], rdx
	mov	rax, QWORD [rbp-56]
	pop	rbp
	ret

cmplx_sub:
    	push rbp
    	mov	rbp, rsp
    	mov	QWORD [rbp-40], rdi
    	fldz
    	fstp	TWORD [rbp-32]
    	fldz
    	fstp	TWORD [rbp-16]
    	fld	TWORD [rbp+16]
    	fld	TWORD [rbp+48]
    	fsubp	st1, st0
    	fstp	TWORD [rbp-32]
    	fld	TWORD [rbp+32]
    	fld	TWORD [rbp+64]
    	fsubp	st1, st0
    	fstp	TWORD [rbp-16]
    	mov	rax, QWORD [rbp-40]
    	mov	rdx, QWORD [rbp-32]
    	mov	QWORD [rax], rdx
    	mov	rdx, QWORD [rbp-24]
    	mov	QWORD [rax+8], rdx
    	mov	rdx, QWORD [rbp-16]
    	mov	QWORD [rax+16], rdx
    	mov	rdx, QWORD [rbp-8]
    	mov	QWORD [rax+24], rdx
    	mov	rax, QWORD [rbp-40]
    	pop	rbp
    	ret


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
cmplx_mul_add:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 96
	mov	QWORD [rbp-56], rdi
	lea	rax, [rbp-48]
	push QWORD [rbp+72]
	push QWORD [rbp+64]
	push QWORD [rbp+56]
	push QWORD [rbp+48]
	push QWORD [rbp+40]
	push QWORD [rbp+32]
	push QWORD [rbp+24]
	push QWORD [rbp+16]
	mov	rdi, rax
	call cmplx_mul
	add	rsp, 64
	lea	rax, [rbp-96]
	push QWORD[rbp+104]
	push QWORD [rbp+96]
	push QWORD[rbp+88]
	push QWORD [rbp+80]
	push QWORD [rbp-24]
	push QWORD [rbp-32]
	push QWORD [rbp-40]
	push QWORD [rbp-48]
	mov	rdi, rax
	call cmplx_add
	add	rsp, 64
	mov	rax, QWORD [rbp-96]
	mov	QWORD [rbp-48], rax
	mov	rax, QWORD [rbp-88]
	mov	QWORD [rbp-40], rax
	mov	rax, QWORD [rbp-80]
	mov	QWORD [rbp-32], rax
	mov	rax, QWORD [rbp-72]
	mov	QWORD [rbp-24], rax
	mov	rax, QWORD [rbp-56]
	mov	rdx, QWORD [rbp-48]
	mov	QWORD [rax], rdx
	mov	rdx, QWORD [rbp-40]
	mov	QWORD [rax+8], rdx
	mov	rdx, QWORD [rbp-32]
	mov	QWORD [rax+16], rdx
	mov	rdx, QWORD [rbp-24]
	mov	QWORD [rax+24], rdx
	mov	rax, QWORD [rbp-56]
	ret

eval_element:
	push rbp
	mov	rbp, rsp
	sub	rsp, 96
	mov	QWORD [rbp-88], rdi
	lea	rax, [rbp-80]
	push QWORD [rbp+104]
	push QWORD [rbp+96]
	push QWORD [rbp+88]
	push QWORD [rbp+80]
	push QWORD [rbp+72]
	push QWORD [rbp+64]
	push QWORD [rbp+56]
	push QWORD [rbp+48]
	mov	rdi, rax
	call cmplx_div
	add	rsp, 64
	lea	rax, [rbp-48]
	push QWORD [rbp-56]
	push QWORD [rbp-64]
	push QWORD [rbp-72]
	push QWORD [rbp-80]
	push QWORD [rbp+40]
	push QWORD [rbp+32]
	push QWORD [rbp+24]
	push QWORD [rbp+16]
	mov	rdi, rax
	call cmplx_sub
	add	rsp, 64
	mov	rax, QWORD [rbp-88]
	mov	rdx, QWORD [rbp-48]
	mov QWORD [rax], rdx
	mov	rdx, QWORD [rbp-40]
	mov QWORD [rax+8], rdx
	mov	rdx, QWORD [rbp-32]
	mov QWORD [rax+16], rdx
	mov	rdx, QWORD [rbp-24]
	mov QWORD [rax+24], rdx
	mov	rax, QWORD [rbp-88]
	ret

eval_poly:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 96
	mov	QWORD PTR [rbp-72], rdi
	mov	QWORD PTR [rbp-80], rsi
	mov	DWORD PTR [rbp-84], edx
	fldz
	fstp TWORD [rbp-48]
	fldz
	fstp TWORD [rbp-32]
	fldz
	fstp TWORD [rbp-48]
	fldz
	fstp TWORD [rbp-32]
	mov	eax, DWORD [rbp-84]
	mov	DWORD [rbp-52], eax
	jmp	.L28
.L29:
	mov	eax, DWORD [rbp-52]
	cdqe
	sal	rax, 5
	mov	rdx, rax
	mov	rax, QWORD [rbp-80]
	add	rax, rdx
	lea	rdx, [rbp-48]
	push QWORD [rax+24]
	push QWORD [rax+16]
	push QWORD [rax+8]
	push QWORD [rax]
	push QWORD [rbp+40]
	push QWORD [rbp+32]
	push QWORD [rbp+24]
	push QWORD [rbp+16]
	push QWORD [rbp-24]
	push QWORD [rbp-32]
	push QWORD [rbp-40]
	push QWORD [rbp-48]
	mov	rdi, rdx
	call cmplx_mul_add
	add	rsp, 96
	sub	DWORD [rbp-52], 1
.L28:
	cmp	DWORD [rbp-52], 0
	jns	.L29
	mov	rax, QWORD [rbp-72]
	mov	rdx, QWORD [rbp-48]
	mov	QWORD [rax], rdx
	mov	rdx, QWORD [rbp-40]
	mov	QWORD [rax+8], rdx
	mov	rdx, QWORD [rbp-32]
	mov	QWORD [rax+16], rdx
	mov	rdx, QWORD [rbp-24]
	mov	QWORD [rax+24], rdx
	mov	rax, QWORD [rbp-72]
	ret

prepare_deriv_coeffs:
	push rbp
	mov	rbp, rsp
	sub	rsp, 32
	mov	QWORD [rbp-24], rdi
	mov	DWORD [rbp-28], esi
	mov	eax, DWORD [rbp-28]
	add	eax, 1
	cdqe
	mov	esi, 32
	mov	rdi, rax
	call calloc
	mov	QWORD [rbp-8], rax
	mov	eax, DWORD [rbp-28]
	mov	DWORD [rbp-12], eax
	jmp	.L33
.L34:
	mov	eax, DWORD [rbp-12]
	cdqe
	sal	rax, 5
	lea	rdx, [rax-32]
	mov	rax, QWORD [rbp-8]
	add	rax, rdx
	mov	edx, DWORD [rbp-12]
	movsx rdx, edx
	mov	rcx, rdx
	sal	rcx, 5
	mov	rdx, QWORD [rbp-24]
	add	rdx, rcx
	fld	TWORD [rdx]
	fild DWORD [rbp-12]
	fmulp st1, st0
	fstp TWORD [rax]
	mov	eax, DWORD [rbp-12]
	cdqe
	sal	rax, 5
	lea	rdx, [rax-32]
	mov	rax, QWORD [rbp-8]
	add	rax, rdx
	mov	edx, DWORD [rbp-12]
	movsx	rdx, edx
	mov	rcx, rdx
	sal	rcx, 5
	mov	rdx, QWORD [rbp-24]
	add	rdx, rcx
	fld	TWORD [rdx+16]
	fstp TWORD [rax+16]
	sub	DWORD [rbp-12], 1
.L33:
	cmp	DWORD [rbp-12], 0
	jg	.L34
	mov	rax, QWORD [rbp-8]
	leave
	ret
