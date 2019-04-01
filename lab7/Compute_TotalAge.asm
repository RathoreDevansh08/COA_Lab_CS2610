.data
array: .word 1 3 20 30 32 60

.text

main:
la $t2, array
addi $t3, $zero, 24
and $t0, $zero, $t0
and $t1, $zero, $t1

loop:
lw $t4, 0($t2)
add $t1, $t1, $t4
add $t0, $t0, 4
add $t2, $t2, 4
beq $t0, $t3, end
j loop
syscall

end:
li $v0, 1
add $a0, $t1, $zero
syscall
