; Programs are loaded as starting positions and sector counts
; Bigger programs (>4 sectors) need to load their remaining parts manually
; TODO: add a multi load functionality
; let NUM-NAME.nasm be the program
; cx = NUM

testp db "test",0
cow db "cow",0

CHECK:
    call strcmp
    test bl, bl
    jz .no_match
    inc cx
    imul cx, 4
    mov al, 4
    .no_match:
        ret

COMMANDS:
    mov bx, testp
    mov cx, 0
    call CHECK
    test bl, bl
    jnz .finish

    mov bx, cow
    mov cx, 1
    call CHECK
    test bl, bl
    jnz .finish

    .finish:
        ret
    
%include "lib/strcmp.nasm"
