.data
buff: .space 100
str1: .asciiz "\n"

.text

main:
la $t1, buff
li $s1, 20
li $s2, 40
li $s3, 60
li $s0, 80

sw $s0, 0($t1)
sw $s1, 4($t1)
sw $s2, 8($t1)
sw $s3, 12($t1)

addi $t3, $zero, 16
and $t0, $zero, $t0

loop:
li $v0, 1
lw $a0, 0($t1)
syscall
li $v0, 4
la $a0, str1
syscall
add $t0, $t0, 4
add $t1, $t1, 4
beq $t0, $t3, end
j loop

end:
syscall
