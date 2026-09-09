; takes si as argument string

print:
	pusha
	mov ah, 0x0e
	mov bh, 0
	print_loop:
		mov al, [si]
		cmp al, 0
		je print_end
		int 0x10
		inc si
		jmp print_loop
	print_end:
		popa
		ret
