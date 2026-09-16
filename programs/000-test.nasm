%include "lib/constants.nasm"
[org PROGRAM_START]

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
    call print_nl
    jmp KERNEL_START

text:
    db "Hello, World!",0

%include "lib/print_nl.nasm"

times 2048 - $ + $$ db 0
