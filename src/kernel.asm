%include "lib/constants.asm"
[org KERNEL_START]

pop cx
cmp cx, KERNEL_CODE
jne .PROGRAM_END

mov bx, PROGRAM_START

call .TEST
call READ_DISK
jmp PROGRAM_START

.PROGRAM_END:
    jmp $

%include "src/program_register.asm"
%include "lib/clear_screen.asm"
%include "lib/read_disk.asm"

times 512 - $ + $$ db 0
