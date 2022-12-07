section .bss

section .text
global main

main:
	; Fil the stack with array numbers
	push	0
	push	2
	push 	4
	push	3

	mov		rbp, rsp
	
	; Target value
	mov		rax, 7
	mov 	rcx, 0

loop:
	mov 	rdi, [rbp+rcx]
	mov 	rsi, 0

inner_loop:
	cmp		rdi, [rbp+rsi]
	add 	rsi, 8
	je 		inner_loop

	add		rdi, [rbp+rsi]
	
	cmp		rdi, rax
	je 		found

	add		rcx, 8
	cmp		rcx, 32
	jne		loop

found:
	push	rcx
	call 	div_val
	call	print_val
	pop		rsi
	call	div_val
	call 	print_val

	; Exit
	mov 	rax, 60
	mov 	rdi, 0
	syscall

print_val:
	push	rax
	push	rdi

	mov		rax, 0
	mov 	rdi, fmt
	extern 	printf
	call	printf

	pop 	rdi
	pop 	rax

	ret

div_val:
	push	rax
	push	rcx
	push	rdx

	mov 	rcx, 8
	xor		rdx, rdx

	mov 	rax, rsi
	div 	rcx
	mov 	rsi, rax

	pop 	rdx
	pop		rcx
	pop 	rax

	ret

section .data
fmt:
	db 	"%d", 10, 0