#
# String Comparison Using MIPS Assembly
#
# By: Jatin Kumar Mandav
#
.text
main:
	la $s0, string1
	jal getStr
	
	la $s0, string2
	jal getStr
	
	la $a0, string1
	jal strlen
	add $t1, $t0, $zero

	move $t0, $zero

	la $a0, string2
	jal strlen
	add $t2, $t0, $zero

	beq $t1, $t2, lenEqual
	bne $t1, $t2, raiseError
	
	lenEqual:
		la $a0, string1
		la $a1, string2
		
		addi $s0, $zero, 1
		
		jal strcmp
		
		li $v0, 1
		move $a0, $s0
		syscall
		
		j exit	
	raiseError:
		li $v0, 4
		la $a0, strNotEqual
		syscall
		j exit

exit:
	li $v0, 10
	syscall

strcmp:
	lbu $t0, 0($a0)
	lbu $t1, 0($a1)
	beqz $t0, return
	bne $t0, $t1, notEqual
	addi $a0, $a0, 1
	addi $a1, $a1, 1
	
	return: jr $ra

notEqual:
	subi $s0, $s0, 1
	
strlen:
	lbu $t2, 0($a0)
	beqz $t2, return
	addi $t0, $t0, 1
	addi $a0, $a0, 1
	j strlen
	
getStr:
	li $v0, 4
	la $a0, prompt
	syscall
	
	li $v0, 8
	add $a0, $zero, $s0
	la $a1, inputSize
	syscall
	
	jr $ra

printStrings:
	li $v0, 4
	la $a0, string1
	syscall
	
	la $a0, string2
	syscall	
	
	jr $ra

.data
prompt: .asciiz "Enter String: "
string1: .space 81
string2: .space 81
inputSize: .word 80
strNotEqual: .asciiz "Input Strings are Not Equal!\n"
