%include "lib/constants.asm"
[org KERNEL_START]

pop cx
cmp cx, PROGRAM_EXEC_FINISHED
je PROGRAM_END

mov bx, PROGRAM_START

call COW
call READ_DISK
jmp PROGRAM_START

PROGRAM_END:
    mov al, 'F'
    call print_char
    jmp $

%include "src/program_register.asm"
%include "lib/print_char.asm"
%include "lib/read_disk.asm"

times 512 - $ + $$ db 0