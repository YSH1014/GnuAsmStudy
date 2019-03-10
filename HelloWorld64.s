.data
	msg: .ascii "Hello,World"
	length = . - msg
.text 
.global _start
_start:
	mov $1,%rax
	mov $1,%rdi  #write to screen
	mov $msg,%rsi
	mov $length,%rdx
	syscall

	#exit
	mov $60,%rax
	mov $0,%rdi
	syscall
