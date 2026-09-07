; Programs are loaded as starting positions and sector counts
; Formula:
; let NUM-NAME.asm be the program
; cl = NUM + 3 + sum(al up to current) - al
; sum(al) = cat src/program_register.asm | grep "mov al" | cut -d', ' -f2 | awk '{sum += $1} END {print sum}' 

TEST:
    mov cl, 0
    jmp FINISH

COW:
    mov cl, 1
    jmp FINISH

FINISH:
    mov ch, 0
    mul cx, 4
    add cl, 3
    mov al, 4
    ret