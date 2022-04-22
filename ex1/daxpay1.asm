.data 
	space:    .ascii ", "
	a:     .word 3
	n:     .word 10
	x:     .word 1,2,3,4,5,6,7,8,9,10
	y:     .word 2,4,6,8,10,12,14,16,18,20

.text
	.globl main
	main:
		
		
		lw $s0,a
		lw $s1,n
		sll $s1,$s1,2
		
		#Clear $t0 to0
		addi $t0,$zero,0
		while:
			beq $t0,$s1,exit
			lw $t1,x($t0)
			lw $t2,y($t0)
		        mul $t3, $t1,$s0
		        add $t3,$t3,$t2
		        sw  $t3,y($t0)
		        #rint the new array
		        li $v0,1
		        move $a0,$t3
		        syscall 
		        li $v0,4
		        la $a0,space
		        syscall
		        
		        addi $t0,$t0,4
			j while
		
		exit:
		#tell the os that this is end the program
		li $v0,10
		syscall 
		

		
				
		
