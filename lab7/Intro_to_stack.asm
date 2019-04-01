.text
li $s0, 1
li $s1, 2
li $s2, 3
li $s3, 4
li $s4, 5
li $s5, 6
li $s6, 7
li $s7, 8

sub $sp, $sp, 32
sw $s0, 28($sp)
sw $s1, 24($sp)
sw $s2, 20($sp)
sw $s3, 16($sp)
sw $s4, 12($sp)
sw $s5, 8($sp)
sw $s6, 4($sp)
sw $s7, 0($sp)

addi $s0, $s0, 1
addi $s1, $s1, 1
addi $s2, $s2, 1
addi $s3, $s3, 1
addi $s4, $s4, 1
addi $s5, $s5, 1
addi $s6, $s6, 1
addi $s7, $s7, 1

lw $t0, 28($sp)
lw $t1, 24($sp)
lw $t2, 20($sp)
lw $t3, 16($sp)
lw $t4, 12($sp)
lw $t5, 8($sp)
lw $t6, 4($sp)
lw $t7, 0($sp)

add $t0, $s0, $t0
add $t1, $s1, $t1
add $t2, $s2, $t2
add $t3, $s3, $t3
add $t4, $s4, $t4
add $t5, $s5, $t5
add $t6, $s6, $t6
add $t7, $s7, $t7

addiu $sp, $sp, 32
syscall
