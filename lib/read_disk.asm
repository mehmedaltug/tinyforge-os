BOOT_DRIVE db 0

; Read al sectors, starting from cl (1 is bootloader), from drive 0 and map result to bx
READ_DISK:
    pusha
    push cx
    push bx
    push ax
    mov [BOOT_DRIVE], dl
    mov al, "B"
    mov ah, 0x0e
    mov bh, 0
    mov bl, 3
    int 0x10
    
    pop ax
    pop bx
    pop cx
    mov ah, 0x02                   ; disk read code
    mov ch, 0                      ; cylinder
    mov dh, 0                      ; disk number
    mov dl, [BOOT_DRIVE]           ; drive number to read
    int 0x13
    
    jnc noError
    mov al, "E"
    mov ah, 0x0e
    int 0x10
    jmp $
    
    noError:
        popa
        ret
