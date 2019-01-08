.data
dataItem:
	.long 14,25,33
	length = (. - dataItem)/4
.text 
.global _start
_start:
	# eax,current maxinum
	# ebx,current value
	# ecx,loop count
	movl $length,%ecx
	movl $0,%eax

	main_loop:
		# dec and inc are couple
		decl %ecx
		movl dataItem(,%ecx,4),%ebx
		incl %ecx
		
		cmpl %eax,%ebx
		jl   next_loop
		movl %ebx,%eax

	next_loop: loop main_loop

	movl $0x00,%eax
	int $0x80
