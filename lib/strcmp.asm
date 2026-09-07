; bx & cx as string, returns bx = 1 for true, 0 for false

strcmp:
    push ax
    push di
    mov di, cx
    strcmp_loop:
        mov al, [bx]
        mov ah, [di]
        cmp al, ah
        jne strcmp_false
        inc bx
        inc di
        cmp al, 0
        jne strcmp_loop
        pop di
        pop ax
        mov bx, 0x0001
        ret
    strcmp_false:
        pop di
        pop ax
        mov bx, 0x0000
        ret
