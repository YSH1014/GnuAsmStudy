#Read a file,and display on screen
.data
filename : .ascii "HelloWorld.s\0"
fd :.long  0
.section .bss
.lcomm  fileBuffer , 20
.text
.global _start
_start:
	movl $0x05 , %eax
	movl $filename,%ebx
	movl $0 , %ecx      #0:read only
	movl $0666,%edx
	int  $0x80
	movl %eax,fd

	#read and print
	read_loop:
		movl $3,%eax
		movl fd,%ebx
		movl $fileBuffer,%ecx
		movl $20 , %edx
		int $0x80
		cmpl $0,%eax 
		jle  close	# 0>eax, close file
		
		#print to screen 
		movl %eax,%edx
		movl $4,%eax
		movl $1,%ebx
		movl $fileBuffer, %ecx
		int $0x80
		jmp read_loop

		
	#close
	close:

	movl fd,%ebx
	movl $0x06,%eax
	int  $0x80

	#exit
	movl $1,%eax
	movl $0,%ebx
	int  $0x80
		
