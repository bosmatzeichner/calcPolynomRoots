
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
