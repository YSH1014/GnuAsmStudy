#calculate the power x^y
.data
arrayX: .long 1,2,3,4,5
len = (. - arrayX)/4
arrayY: .long 2,3,4,5,6
results: .long 0,0,0,0,0

.text
.global _start
_start:
	movl $len,%ecx
	mainLoop:
		pushl %ecx
		decl %ecx
		movl arrayY(,%ecx,4),%eax
		pushl %eax
		movl arrayX(,%ecx,4),%eax
		pushl %eax
		call power	
		movl %eax,results(,%ecx,4)
		incl %ecx
		popl %ecx
	loop mainLoop

	movl $0,%ebx
	movl $1,%eax
	int $0x80	



power:
# two arguments :
# x -> ebx
# y-> ecx
	popl %ebp
	movl $1,%eax
	popl %ebx
	popl %ecx
	
	multiloop:
		imull %ebx,%eax
	loop multiloop
	
	pushl %ebp
	ret

