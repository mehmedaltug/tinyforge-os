; Programs are loaded as starting positions and sector counts
; Formula:
; let NUM-NAME.asm be the program
; cl = NUM + 3 + sum(al up to current) - al
; sum(al) = cat src/program_register.asm | grep "mov al" | cut -d', ' -f2 | awk '{sum += $1} END {print sum}' 

.TEST:
    mov cl, 3
    mov al, 1
    ret