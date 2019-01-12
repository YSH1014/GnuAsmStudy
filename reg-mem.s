.data 
	value: .long 0xaabbccdd
.text
.global _start
_start:
	movl $value,%eax
	movl value,%ebx
	#break here and display memary
	# compare these command
	# x &value
	# x /4xb &value  
	
	movl $1,%eax
	movl $0,%ebx
	int $0x80
