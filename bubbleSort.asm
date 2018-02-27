#
# Bubble Sort Using MIPS Assembly
#
# By: Jatin Kumar Mandav
#
.data
array: .space 20
prompt: .asciiz "Array: "
space: .asciiz " "
sortArray: .asciiz "Sorted Array: "

.text
main:
	li $v0, 4
	la $a0, prompt
	syscall
	
	addi $t0, $zero, 0
	while:
		beq $t0, 20, bubbleSort
		
		li $v0, 5
		syscall
		
		sw $v0, array($t0)
		addi $t0, $t0, 4
		
		j while

bubbleSort:
	addi $t0, $zero, -4
	outerLoop:
		addi $t0, $t0, 4
		beq $t0, 20, printArray
		move $t1, $t0
		innerLoop:
			beq $t1, 20, outerLoop
			lw $t5, array($t0)
			lw $t6, array($t1)
			bgt $t5, $t6, swapValues
			
			addi $t1, $t1, 4
			
			j innerLoop

swapValues:
	lw $t4, array($t0)
	lw $t5, array($t1)
	
	sw $t4, array($t1)
	sw $t5, array($t0)
	
	addi $t1, $t1, 4
	
	j innerLoop

printArray:
	addi $t0, $zero, 0

	li $v0, 4
	la $a0, sortArray
	syscall
	
	loop:
		beq $t0, 20, Exit
		
		li $v0, 1
		lw $a0, array($t0)
		syscall
		
		li $v0, 4
		la $a0, space
		syscall
		
		addi $t0, $t0, 4
		
		j loop

Exit:
	li $v0, 10
	syscall
