[bits 16]
[org 0x7c00]

xor ax, ax
mov es, ax
mov ss, ax
mov sp, 0x7c00

mov bx, KERNEL_START            ; Where to put read sectors
mov al, 2                       ; How many sectors
mov cl, 2                       ; Where to start

call READ_DISK
jmp bx

%include "lib/constants.nasm"
%include "lib/read_disk.nasm"

times 510-($-$$) db 0
dw 0xaa55
