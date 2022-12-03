; Calculate the sum of evry even number in the Fibonacci under 4 million


section 	.bss


section 	.text
global 		main

main:
	; Starting numbers
	mov 	rax, 3
	mov		rdi, 2
	mov		rsi, 2
	mov		r8, 2 

loop:
	; Calculate next number
	mov		rcx, rax
	add		rax, rdi
	mov		rdi, rcx
	; Check loop
	cmp		rax, 4000000
	jg		exit
	; Check if eaven
	test	rax, 1
	jnz		loop
	; Add to eaven total
	add		rsi, rax
	jmp		loop

exit:
	; Print value
	call 	print_num

	mov 	rax, 60
	mov 	rdi, 0
	syscall

print_num:
	push	rax
	push	rdi
	push	rsi

	mov		rax, 0
	mov 	rdi, fmts

	extern	printf
	call	printf

	pop		rsi
	pop		rdi
	pop		rax

	ret

section 	.data
fmts:
	db	'%d', 10, 0
