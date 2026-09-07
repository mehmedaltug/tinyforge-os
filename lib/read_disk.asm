; Read al sectors, starting from cl (1 is bootloader) in ch cylşnder, from the BIOS drive in DL

READ_DISK:
    pusha
    mov ah, 0x02                   ; disk read code
    mov dh, 0                      ; head
    int 0x13
    
    jnc noError
    mov al, "E"
    mov ah, 0x0e
    int 0x10
    jmp $
    
    noError:
        popa
        ret
