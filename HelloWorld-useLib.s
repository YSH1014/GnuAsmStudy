.data 
msg1: .ascii "Hello,World\n\0"
msg2: .ascii "%d + %d = %d\n\0"
.text
.global _start
_start:
	pushl $msg1
	call printf
	
	movl $2,%eax
	movl $3,%ebx
	addl %eax,%ebx
	pushl %ebx
	pushl $msg2
	call printf

	movl $0,%ebx
	movl $1,%eax
	int $0x80
