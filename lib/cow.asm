cow:
	mov bx, cow_part1
	mov bx, cow_part1
	call print
	call print_nl
	mov bx, cow_part2
	call print
	call print_nl
	mov bx, cow_part3
	call print
	call print_nl
	mov bx, cow_part4
	call print
	call print_nl
	mov bx, cow_part5
	call print
	call print_nl
	mov bx, cow_part6
	call print
	call print_nl
	mov bx, cow_part7
	call print
	call print_nl
	ret

cow_part1:
	db "           (    )",0
cow_part2:
	db "            (oo)",0
cow_part3:
	db "   )\.-----/(O O)",0
cow_part4:
	db "  # ;       / u",0
cow_part5:
	db "    (  .   |} )",0
cow_part6:
	db "     |/ `.;|/;",0
cow_part7:
	db '     "     " "',0
