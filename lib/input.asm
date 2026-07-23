; gets character to al

get_char:
	push bx
	mov bh, ah
	mov ah, 0x0
	int 0x16                ; get input
	mov ah, 0x0e
	int 0x10                ; print same input to screen
	mov ah, bh
	pop bx
	ret
