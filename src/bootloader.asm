[bits 16]
[org 0x7c00]

xor ax, ax
mov es, ax
mov ss, ax
mov sp, 0x7c00

mov bx, KERNEL
mov al, 1

jmp READ_DISK

%include "lib/read_disk.asm"

times 510-($-$$) db 0
dw 0xaa55

KERNEL:
