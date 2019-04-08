.data
arr: .space 100
text: .asciiz "LAB EXAM :: Devansh Singh Rathore (111701011)\n"
txt1: .asciiz "\nEnter no.: "
ts: .asciiz "\nSorted Array: "
tm: .asciiz "\n\nMatrix:\n"
td: .asciiz "\nDeterminant: "
ta: .asciiz "\nAverage: "
nl: .asciiz "\n"
.text

main:
la $t0, arr

li $v0, 4
la $a0, text
syscall

input:
add $s0, $zero, $zero
addi $s1, $zero, 9
addi $s7, $zero, 1
add $t5, $zero, $zero

iloop:
beq $s0, $s1, endi
li $v0, 4
la $a0, txt1
syscall
li $v0, 5
syscall
move $t1, $v0
add $t5, $t5, $t1
sw $t1, 0($t0)
addi $t0, $t0, 4
addi $s0, $s0, 1
j iloop

endi:

det:

la $t0, arr

li $v0, 4
la $a0, tm
syscall

li, $v0, 1
lw $a0, 0($t0)
syscall
li, $v0, 1
lw $a0, 4($t0)
syscall
li, $v0, 1
lw $a0, 8($t0)
syscall
li $v0, 4
la $a0, nl
syscall

li, $v0, 1
lw $a0, 12($t0)
syscall
li, $v0, 1
lw $a0, 16($t0)
syscall
li, $v0, 1
lw $a0, 20($t0)
syscall
li $v0, 4
la $a0, nl
syscall

li, $v0, 1
lw $a0, 24($t0)
syscall
li, $v0, 1
lw $a0, 28($t0)
syscall
li, $v0, 1
lw $a0, 32($t0)
syscall
li $v0, 4
la $a0, nl
syscall

li $v0, 4
la $a0, td
syscall
add $t8, $zero, $zero
la $t0, arr

lw $t9, 16($t0)
lw $s4, 32($t0) 
mul $t7, $t9, $s4
lw $t9, 20($t0)
lw $s4, 28($t0)
mul $t6, $t9, $s4
sub $t8, $t7, $t6
lw $t9, 0($t0)
mul $t8, $t8, $t9

lw $t9, 12($t0)
lw $s4, 32($t0) 
mul $t7, $t9, $s4  
lw $t9, 24($t0)
lw $s4, 20($t0)
mul $t6, $t9, $s4
sub $t7, $t6, $t7
lw $t9, 4($t0)
mul $t9, $t9, $t7
add $t8, $t8, $t9

lw $t9, 12($t0)
lw $s4, 28($t0) 
mul $t7, $t9, $s4  
lw $t9, 16($t0)
lw $s4, 24($t0)
mul $t6, $t9, $s4
sub $t7, $t7, $t6
lw $t9, 8($t0)
mul $t7, $t7, $t9
add $t8, $t8, $t7

li, $v0, 1
move $a0, $t8
syscall
jal sort
syscall

sort:
addi $s2, $zero, 0
la $t0, arr

sloop1: 
beq $s1, $s2, prints
addi $s3, $zero, 0
addi $s2, $s2, 1
la $t2, arr

sloop2:
beq $s1, $s3, next
lw $s4, 0($t0)
lw $s5, 0($t2)
slt $s6, $s5, $s4
beq $s6, $s7, swap

nt:
addi $s3, $s3, 1
addi $t2, $t2, 4
j sloop2

next:
addi $t0, $t0, 4
j sloop1
syscall

avg:
div $t5, $t5, $s1
li $v0, 4
la $a0, ta
syscall
li $v0, 1
move $a0, $t5
syscall
jal ends
syscall


swap:
sw $s4, 0($t2)
sw $s5, 0($t0)
jal nt

prints:
la $t7, arr
addi $t6, $zero, 0

li $v0, 4
la $a0, ts
syscall

ploop:
beq $t6, $s1, avg
lw $t4, 0($t7)
li $v0, 1
move $a0, $t4
syscall
addi $t6, $t6, 1
addi $t7, $t7, 4
j ploop

ends:
li $v0, 10
syscall
