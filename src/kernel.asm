[org 0x7e00]

mov bx, text

.print_loop:
    mov ah, 0x0e
    mov al, [bx]
    inc bx
    cmp al, 0
    je .print_loop_exit
    int 0x10
    jmp .print_loop
.print_loop_exit:
jmp $

text:
    db "Hello, World!",0
