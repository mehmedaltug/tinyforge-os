%include "lib/constants.nasm"
[org KERNEL_START]

cmp [command], 0
jne NEW_LINE.continue

MAIN:
    call clear_screen
    mov di, command
    mov si, prompt
    call print
    .loop:
        call get_char
        cmp al, BACKSPACE_CHAR
        jne .non_backspace
        
        cmp di, command
        jne .erase_char
        mov al, SPACE_CHAR
        call print_char
        jmp .loop
        .erase_char:
            mov byte [di], 0
            dec di
            mov al, SPACE_CHAR
            call print_char
            mov al, BACKSPACE_CHAR
            call print_char
            jmp .loop
        .non_backspace:
            cmp al, ENTER_CHAR
            je NEW_LINE
            mov byte [di], al
            inc di
            jmp .loop

NEW_LINE:
    call print_nl
    mov si, command
    call COMMANDS
    cmp bx, 0
    je .skip_exec
    call PROGRAM_EXEC
    .skip_exec:
    mov si, not_found
    call print
    call print_nl
    .continue:
    mov si, prompt
    call print
    call RESET_COMMAND
    jmp MAIN.loop

%include "src/program_register.nasm"
%include "lib/print_char.nasm"
%include "lib/print_nl.nasm"
%include "lib/print.nasm"
%include "lib/clear_screen.nasm"
%include "lib/read_disk.nasm"
%include "lib/input.nasm"

PROGRAM_EXEC:
    mov bx, PROGRAM_START
    call READ_DISK
    jmp PROGRAM_START

RESET_COMMAND:
    mov di, command
    .loop:
        mov byte [di], 0
        inc di
        cmp di, command+256
        jne .loop
    mov di, command
    ret

command times 256 db 0
prompt db "!# ",0
not_found db " Command Not Found!",0

BACKSPACE_CHAR equ 0x08
ENTER_CHAR equ 0x0d
SPACE_CHAR equ 0x20
times 1024 - $ + $$ db 0
