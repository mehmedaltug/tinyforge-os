; takes bx as argument string

print:
	pusha
	mov ah, 0x0e
	print_loop:
		mov al, [bx]
		cmp al, 0
		je _end
		int 0x10
		inc bx
		jmp print_loop
	print_end:
		popa
		ret
