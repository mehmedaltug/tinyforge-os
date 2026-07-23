; bx as starting pos, return ax as num
str_to_int:
    push cx
    xor ax, ax
    str_to_int_loop:
		movzx cx, byte[bx]
		cmp cl, 0
		je str_to_int_end
		sub cl, '0'
		imul ax, 10
		add ax, dx
		inc bx
		jmp str_to_int_loop
    str_to_int_end:
    pop cx
    ret
