; Read al sectors, starting from cl (1 is bootloader) in ch cylinder

READ_DISK:
    pusha
    mov ah, 0x02                   ; disk read code
    mov dx, 0x0080                 ; head (dh), drive (dl, 0x80 dor hard disk)
    int 0x13
    
    jnc noError
    mov al, "E"
    mov ah, 0x0e
    int 0x10
    jmp $
    
    noError:
        popa
        ret
