section .text
    global cmplx_add
    global cmplx_sub
    global cmplx_mul
    global cmplx_div
    global cmplx_mul_add
    global prepare_deriv_coeffs
    global eval_poly
    global eval_euclidean_sqrt_norm
    global sqrtNorm_bigger_then_tolerance
    global eval_element
    global eval_next_seq_element
    global calcRoot
    extern calloc
    extern free

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

cmplx_mul_add:
        push    rbp
        mov     rbp, rsp
        push    rbx
        sub     rsp, 56
        mov     QWORD [rbp-24], rdi
        mov     rax, QWORD [rbp-24]
        push    QWORD [rbp+72]
        push    QWORD [rbp+64]
        push    QWORD [rbp+56]
        push    QWORD [rbp+48]
        push    QWORD [rbp+40]
        push    QWORD [rbp+32]
        push    QWORD [rbp+24]
        push    QWORD [rbp+16]
        mov     rdi, rax
        call    cmplx_mul
        add     rsp, 64
        mov     rbx, QWORD [rbp-24]
        lea     rdx, [rbp-64]
        push    QWORD [rbp+104]
        push    QWORD [rbp+96]
        push    QWORD [rbp+88]
        push    QWORD [rbp+80]
        mov     rax, QWORD [rbp-24]
        push    QWORD [rax+24]
        push    QWORD [rax+16]
        push    QWORD [rax+8]
        push    QWORD [rax]
        mov     rdi, rdx
        call    cmplx_add
        add     rsp, 64
        mov     rax, QWORD [rbp-64]
        mov     rdx, QWORD [rbp-56]
        mov     QWORD [rbx], rax
        mov     QWORD [rbx+8], rdx
        mov     rax, QWORD [rbp-48]
        mov     rdx, QWORD [rbp-40]
        mov     QWORD [rbx+16], rax
        mov     QWORD [rbx+24], rdx
        nop
        mov     rax, QWORD [rbp-24]
        mov     rbx, QWORD [rbp-8]
        leave
        ret

prepare_deriv_coeffs:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     QWORD [rbp-24], rdi
        mov     DWORD [rbp-28], esi
        mov     eax, DWORD [rbp-28]
        add     eax, 1
        cdqe
        mov     esi, 32
        mov     rdi, rax
        call    calloc
        mov     QWORD [rbp-16], rax
        mov     eax, DWORD [rbp-28]
        mov     DWORD [rbp-4], eax
        jmp     .orderCheck
.loop:
        mov     eax, DWORD [rbp-4]
        cdqe
        sal     rax, 5
        mov     rdx, rax
        mov     rax, QWORD [rbp-24]
        add     rax, rdx
        fld    TWORD [rax]
        fild    DWORD [rbp-4]
        mov     eax, DWORD [rbp-4]
        cdqe
        sal     rax, 5
        lea     rdx, [rax-32]
        mov     rax, QWORD [rbp-16]
        add     rax, rdx
        fmulp  st1, st0
        fstp   TWORD [rax]
        mov     eax, DWORD [rbp-4]
        cdqe
        sal     rax, 5
        mov     rdx, rax
        mov     rax, QWORD [rbp-24]
        add     rdx, rax
        mov     eax, DWORD [rbp-4]
        cdqe
        sal     rax, 5
        lea     rcx, [rax-32]
        mov     rax, QWORD [rbp-16]
        add     rax, rcx
        fld    TWORD [rdx+16]
        fstp   TWORD [rax+16]
        sub     DWORD [rbp-4], 1
.orderCheck:
        cmp     DWORD [rbp-4], 0
        jg      .loop
.LBE2:
        mov     rax, QWORD [rbp-16]
        leave
        ret
        
eval_poly:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 80
        mov     QWORD [rbp-56], rdi
        mov     QWORD [rbp-64], rsi
        mov     DWORD [rbp-68], edx
        fldz
        fstp    TWORD [rbp-48]
        fldz
        fstp    TWORD [rbp-32]
        fldz
        fstp    TWORD [rbp-48]
        fldz
        fstp    TWORD [rbp-32]
        mov     eax, DWORD [rbp-68]
        mov     DWORD [rbp-4], eax
        jmp     .orderCheck
.loop:
        mov     eax, DWORD [rbp-4]
        cdqe
        sal     rax, 5
        mov     rdx, rax
        mov     rax, QWORD [rbp-64]
        add     rax, rdx
        lea     rdx, [rbp-48]
        push    QWORD [rax+24]
        push    QWORD [rax+16]
        push    QWORD [rax+8]
        push    QWORD [rax]
        push    QWORD [rbp+40]
        push    QWORD [rbp+32]
        push    QWORD [rbp+24]
        push    QWORD [rbp+16]
        push    QWORD [rbp-24]
        push    QWORD [rbp-32]
        push    QWORD [rbp-40]
        push    QWORD [rbp-48]
        mov     rdi, rdx
        call    cmplx_mul_add
        add     rsp, 96
        sub     DWORD [rbp-4], 1
.orderCheck:
        cmp     DWORD [rbp-4], 0
        jns     .loop
        mov     rcx, QWORD [rbp-56]
        mov     rax, QWORD [rbp-48]
        mov     rdx, QWORD [rbp-40]
        mov     QWORD [rcx], rax
        mov     QWORD [rcx+8], rdx
        mov     rax, QWORD [rbp-32]
        mov     rdx, QWORD [rbp-24]
        mov     QWORD [rcx+16], rax
        mov     QWORD [rcx+24], rdx
        mov     rax, QWORD [rbp-56]
        leave
        ret

eval_euclidean_sqrt_norm:
        push    rbp
        mov     rbp, rsp
        fld     TWORD  [rbp+16]
        fld     TWORD  [rbp+16]
        fmulp   st1, st0
        fld     TWORD  [rbp+32]
        fld     TWORD  [rbp+32]
        fmulp   st1, st0
        faddp   st1, st0
        fstp    TWORD  [rbp-16]
        fld     TWORD  [rbp-16]
        pop     rbp
        ret

sqrtNorm_bigger_then_tolerance:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        push    QWORD [rbp+40]
        push    QWORD [rbp+32]
        push    QWORD [rbp+24]
        push    QWORD [rbp+16]
        call    eval_euclidean_sqrt_norm
        add     rsp, 32
        fstp    TWORD [rbp-48]
        mov     rax, QWORD [rbp-48]
        mov     edx, DWORD [rbp-40]
        mov     QWORD [rbp-16], rax
        mov     DWORD [rbp-8], edx
        fld     TWORD [rbp+48]
        fld     TWORD [rbp+48]
        fmulp   st1, st0
        fld     TWORD [rbp-16]
        fucomip st0, st1
        fstp    st0
        setnb   al
        movzx   eax, al
        mov     DWORD [rbp-20], eax
        mov     eax, DWORD [rbp-20]
        leave
        ret

eval_element:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 80
        mov     QWORD [rbp-72], rdi
        lea     rax, [rbp-32]
        push    QWORD [rbp+104]
        push    QWORD [rbp+96]
        push    QWORD [rbp+88]
        push    QWORD [rbp+80]
        push    QWORD [rbp+72]
        push    QWORD [rbp+64]
        push    QWORD [rbp+56]
        push    QWORD [rbp+48]
        mov     rdi, rax
        call    cmplx_div
        add     rsp, 64
        lea     rax, [rbp-64]
        push    QWORD [rbp-8]
        push    QWORD [rbp-16]
        push    QWORD [rbp-24]
        push    QWORD [rbp-32]
        push    QWORD [rbp+40]
        push    QWORD [rbp+32]
        push    QWORD [rbp+24]
        push    QWORD [rbp+16]
        mov     rdi, rax
        call    cmplx_sub
        add     rsp, 64
        mov     rcx, QWORD [rbp-72]
        mov     rax, QWORD [rbp-64]
        mov     rdx, QWORD [rbp-56]
        mov     QWORD [rcx], rax
        mov     QWORD [rcx+8], rdx
        mov     rax, QWORD [rbp-48]
        mov     rdx, QWORD [rbp-40]
        mov     QWORD [rcx+16], rax
        mov     QWORD [rcx+24], rdx
        mov     rax, QWORD [rbp-72]
        leave
        ret
        
eval_next_seq_element:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 112
        mov     QWORD  [rbp-104], rdi
        mov     QWORD  [rbp-112], rsi
        mov     rax, QWORD  [rbp-112]
        mov     edx, DWORD  [rax]
        mov     rax, QWORD  [rbp-112]
        mov     rcx, QWORD  [rax+8]
        lea     rax, [rbp-32]
        push    QWORD  [rbp+40]
        push    QWORD  [rbp+32]
        push    QWORD  [rbp+24]
        push    QWORD  [rbp+16]
        mov     rsi, rcx
        mov     rdi, rax
        call    eval_poly
        add     rsp, 32
        mov     rax, QWORD  [rbp-112]
        mov     eax, DWORD  [rax]
        lea     edx, [rax-1]
        mov     rax, QWORD  [rbp-112]
        mov     rcx, QWORD  [rax+16]
        lea     rax, [rbp-64]
        push    QWORD  [rbp+40]
        push    QWORD  [rbp+32]
        push    QWORD  [rbp+24]
        push    QWORD  [rbp+16]
        mov     rsi, rcx
        mov     rdi, rax
        call    eval_poly
        add     rsp, 32
        lea     rax, [rbp-96]
        push    QWORD  [rbp-40]
        push    QWORD  [rbp-48]
        push    QWORD  [rbp-56]
        push    QWORD  [rbp-64]
        push    QWORD  [rbp-8]
        push    QWORD  [rbp-16]
        push    QWORD  [rbp-24]
        push    QWORD  [rbp-32]
        push    QWORD  [rbp+40]
        push    QWORD  [rbp+32]
        push    QWORD  [rbp+24]
        push    QWORD  [rbp+16]
        mov     rdi, rax
        call    eval_element
        add     rsp, 96
        mov     rcx, QWORD  [rbp-104]
        mov     rax, QWORD  [rbp-96]
        mov     rdx, QWORD  [rbp-88]
        mov     QWORD  [rcx], rax
        mov     QWORD  [rcx+8], rdx
        mov     rax, QWORD  [rbp-80]
        mov     rdx, QWORD  [rbp-72]
        mov     QWORD  [rcx+16], rax
        mov     QWORD  [rcx+24], rdx
        mov     rax, QWORD  [rbp-104]
        leave
        ret
        
calcRoot:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 80
        mov     QWORD  [rbp-40], rdi
        mov     QWORD  [rbp-48], rsi
        mov     rax, QWORD  [rbp-48]
        mov     edx, DWORD  [rax]
        mov     rax, QWORD  [rbp-48]
        mov     rax, QWORD  [rax+8]
        mov     esi, edx
        mov     rdi, rax
        call    prepare_deriv_coeffs
        mov     rdx, rax
        mov     rax, QWORD  [rbp-48]
        mov     QWORD  [rax+16], rdx
        mov     rax, QWORD  [rbp-48]
        mov     edx, DWORD  [rax]
        mov     rax, QWORD  [rbp-48]
        mov     rcx, QWORD  [rax+8]
        lea     rax, [rbp-32]
        push    QWORD  [rbp+40]
        push    QWORD  [rbp+32]
        push    QWORD  [rbp+24]
        push    QWORD  [rbp+16]
        mov     rsi, rcx
        mov     rdi, rax
        call    eval_poly
        add     rsp, 32
        jmp     .toleranceCheck
.whileLoop:
        mov     rax, QWORD  [rbp-48]
        push    QWORD  [rbp+40]
        push    QWORD  [rbp+32]
        push    QWORD  [rbp+24]
        push    QWORD  [rbp+16]
        mov     rsi, rax
        lea     rdi, [rbp+16]
        call    eval_next_seq_element
        add     rsp, 32
        mov     rax, QWORD  [rbp-48]
        mov     edx, DWORD  [rax]
        mov     rax, QWORD  [rbp-48]
        mov     rcx, QWORD  [rax+8]
        lea     rax, [rbp-80]
        push    QWORD  [rbp+40]
        push    QWORD  [rbp+32]
        push    QWORD  [rbp+24]
        push    QWORD  [rbp+16]
        mov     rsi, rcx
        mov     rdi, rax
        call    eval_poly
        add     rsp, 32
        mov     rax, QWORD  [rbp-80]
        mov     rdx, QWORD  [rbp-72]
        mov     QWORD  [rbp-32], rax
        mov     QWORD  [rbp-24], rdx
        mov     rax, QWORD  [rbp-64]
        mov     rdx, QWORD  [rbp-56]
        mov     QWORD  [rbp-16], rax
        mov     QWORD  [rbp-8], rdx
.toleranceCheck:
        push    QWORD  [rbp+56]
        push    QWORD  [rbp+48]
        push    QWORD  [rbp-8]
        push    QWORD  [rbp-16]
        push    QWORD  [rbp-24]
        push    QWORD  [rbp-32]
        call    sqrtNorm_bigger_then_tolerance
        add     rsp, 48
        test    eax, eax
        jne     .whileLoop
        mov     rax, QWORD  [rbp-48]
        mov     rax, QWORD  [rax+16]
        mov     rdi, rax
        call    free
        mov     rcx, QWORD  [rbp-40]
        mov     rax, QWORD  [rbp+16]
        mov     rdx, QWORD  [rbp+24]
        mov     QWORD  [rcx], rax
        mov     QWORD  [rcx+8], rdx
        mov     rax, QWORD  [rbp+32]
        mov     rdx, QWORD  [rbp+40]
        mov     QWORD  [rcx+16], rax
        mov     QWORD  [rcx+24], rdx
        mov     rax, QWORD  [rbp-40]
        leave
        ret