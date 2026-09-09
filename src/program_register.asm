; Programs are loaded as starting positions and sector counts
; Bigger programs (>4 sectors) need to load their remaining parts manually
; TODO: add a multi load functionality
; let NUM-NAME.asm be the program
; cx = NUM

testp db "test",0
cow db "cow",0

FINISH:
    inc cx
    imul cx, 4
    mov al, 4
    ret

COMMANDS:
    mov cx, 0

    mov bx, testp
    call strcmp
    cmp bx, 1
    mov cx, 0
    jmp FINISH

    mov bx, cow
    call strcmp
    cmp bx, 1
    mov cx, 1
    jmp FINISH
    
    ret
    
%include "lib/strcmp.asm"