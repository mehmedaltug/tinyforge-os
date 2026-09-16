; bx & si as string, returns bx = 1 for true, 0 for false

strcmp:
    push ax
    push si
    strcmp_loop:
        mov al, [si]
        cmp al, [bx]
        jne strcmp_false
        inc bx
        inc si
        test al, al
        jne strcmp_loop
        mov bx, 1
        jmp strcmp_exit
    strcmp_false:
        mov bx, 0
    strcmp_exit:
        pop si
        pop ax
        ret
