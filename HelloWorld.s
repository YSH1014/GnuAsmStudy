.data
.global _start
.text
_start:
	movl $0x04,%eax
	movl $_msg,%ecx
	movl $1,%ebx
	movl $len,%edx
	
	int $0x80

_msg:
	.ascii	"Hello,World"
	len = . - _msg
