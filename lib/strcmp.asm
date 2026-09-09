; bx & si as string, returns bx = 1 for true, 0 for false

strcmp:
    push ax
    push si
    strcmp_loop:
        mov ah, [bx]
        mov al, [si]
        cmp al, ah
        jne strcmp_false
        inc bx
        inc si
        cmp al, 0
        jne strcmp_loop
        mov bx, 1
        jmp strcmp_exit
    strcmp_false:
        mov bx, 0
    strcmp_exit:
        pop si
        pop ax
        ret
