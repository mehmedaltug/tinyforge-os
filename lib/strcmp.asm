; bx & cx as string, returns bx = 1 for true, 0 for false

strcmp:
    push ax
    strcmp_loop:
        mov al, [bx]
        mov ah, [cx]
        cmp al, ah
        jne strcmp_false
        inc bx
        inc cx
        cmp al, 0
        jne strcmp_loop
        mov bx, 0x0001
        ret
    strcmp_false:
        mov bx, 0x0000
        ret
