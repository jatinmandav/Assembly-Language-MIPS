#
# Full Adder Using MIPS Assembly
#
# By: Jatin Kumar Mandav
#
.text
main:
	#Prompt for input
	li $v0, 4
	la $a0, prompt
	syscall
	
	li $v0, 5
	syscall
	move $s0, $v0
	
	#Prompt For another input
	li $v0, 4
	la $a0, prompt
	syscall
	
	li $v0, 5
	syscall
	move $s1, $v0
	
	# Find Sum
	addi $s2, $zero, 1
	xor $t0, $s0, $s1
	xor $t0, $t0, $s2
	
	# Finding Carry-out
	and $t1, $s0, $s2
	and $t2, $s0, $s1
	and $t3, $s1, $s2
	
	or $t1, $t1, $t2
	or $t1, $t1, $t3
	
	# Display Sum
	li $v0, 4
	la $a0, displaySum
	syscall
	
	li $v0, 1
	move $a0, $t0
	syscall
	
	# New-line
	li $v0, 4
	la $a0, newline
	syscall
	
	# Display Carry-out
	li $v0, 4
	la $a0, displayCarryOut
	syscall
	
	li $v0, 1
	move $a0, $t1
	syscall
	
	# Exit
	li $v0, 10
	syscall
	
.data
prompt: .asciiz "Enter A binary bit: "
displaySum: .asciiz "Sum: "
displayCarryOut: .asciiz "Carry-Out: "
newline: .asciiz "\n"
