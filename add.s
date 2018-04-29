
section .text
    global cmplx_add
    global cmplx_mul
    global cmplx_div

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

///
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
