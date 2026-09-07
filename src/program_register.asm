; Programs are loaded as starting positions and sector counts
; Bigger programs (>4 sectors) need to load their remaining parts manually
; TODO: add a multi load functionality
; let NUM-NAME.asm be the program
; cx = NUM

TEST:
    mov cx, 0
    jmp FINISH

COW:
    mov cx, 1
    jmp FINISH

FINISH:
    mul cx, 4
    add cx, 3
    mov al, 4
    ret