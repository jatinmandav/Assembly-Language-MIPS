#
# 4 Bit Binary Counter Using MIPS Assembly
#
# By: Jatin Kumar Mandav
#
.text
# Initilaizing Counter
main:
	addi $s0, $zero, 0
	addi $s1, $zero, 0
	addi $s2, $zero, 0
	addi $s3, $zero, 0
	
	addi $t0, $zero, 0

# Counter Loop
loop:
	bgt $t0, 15, exit
	
	# Display Binary Counter Value
	li $v0, 1
	move $a0, $s3
	syscall
		
	li $v0, 1
	move $a0, $s2
	syscall	
	
	li $v0, 1
	move $a0, $s1
	syscall	
	
	li $v0, 1
	move $a0, $s0
	syscall
	
	li $v0, 4
	la $a0, newline
	syscall
	
	# Incrementing Loop Variable
	addi $t0, $t0, 1
	
	# Incrementing the 4-bit binary counter
	move $t2, $s0
	xori $s0, $s0, 1
	andi $t1, $t2, 1
	
	move $t2, $s1
	xor $s1, $s1, $t1
	and $t1, $t2, $t1
	
	move $t2, $s2
	xor $s2, $s2, $t1
	and $t1, $t2, $t1
	
	move $t2, $s3
	xor $s3, $s3, $t1
	andi $t1, $zero, 0
	
	j loop

# Exit the Program
exit:
	li $v0, 10
	syscall

.data
newline: .asciiz "\n"
