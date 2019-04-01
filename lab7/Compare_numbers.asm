.data
A: .word 0xFFFFFFFF
B: .word 0x0000000F
GA: .asciiz "A is greater than B"
GB: .asciiz "B is greater than A"

.text

main:
lw $t2, A
lw $t3, B
slt $t1, $t2, $t3
sltu $t0, $t2, $t3
addi $t4, $zero, 1
li $v0, 4
beq $t4, $t1, printB
bne $t4, $t1, printA
syscall

printB:
li $v0, 4
la $a0, GB
syscall
