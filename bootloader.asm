[bits 16]
[org 0x7c00]

xor ax, ax
mov es, ax
mov ss, ax
mov sp, 0x7c00

mov [BOOT_DRIVE], dl
mov al, "B"
mov ah, 0x0e
mov bh, 0
mov bl, 3
int 0x10

mov ah, 0x02                   ; disk read code
mov al, 1                      ; sectors to read
mov ch, 0                      ; cylinder
mov dh, 0                      ; disk number
mov cl, 2                      ; where to start reading (bootloader is 1)
mov dl, [BOOT_DRIVE]           ; drive number to read
mov bx, KERNEL                 ; where to put it
int 0x13

jnc noError
mov al, "E"
mov ah, 0x0e
int 0x10

noError:
	jmp KERNEL

BOOT_DRIVE db 0

times 510-($-$$) db 0
dw 0xaa55

KERNEL:
