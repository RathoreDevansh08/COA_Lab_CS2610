.data
sm: .asciiz "sum : "
pr: .asciiz "\nproduct : "
av: .asciiz "\naverage : "
mi: .asciiz "\nminimum : "
ma: .asciiz "\nmaximum : "
arr: .float 2.1 2.3 1.1 1.3
ini: .float 1.0 10.0 4.0

.text
la $t5, arr
la $t6, ini
and $t0, $t0, $zero
add $t1, $t1, 16
sub.s $f2, $f2, $f2
l.s $f3, 0($t6)
l.s $f4, 4($t6)
l.s $f6, 8($t6)
sub.s $f5, $f5, $f5

loop:
l.s $f1, 0($t5)
add.s $f2, $f2, $f1
mul.s $f3, $f3, $f1
addi $t5, $t5, 4
addi $t0, $t0, 4

c.lt.s $f1, $f4
bc1t mini
bc1f minc
mini: mov.s $f4, $f1
minc: nop

c.lt.s $f5, $f1
bc1t maxi
bc1f maxc
maxi: mov.s $f5, $f1
maxc: nop

beq $t0, $t1, end
j loop

end: 
li $v0, 4
la $a0, sm
syscall
li $v0, 2
mov.s $f12, $f2
syscall
li $v0, 4
la $a0, pr
syscall
li $v0, 2
mov.s $f12, $f3
syscall
li $v0, 4
la $a0, av
syscall
li $v0, 2
div.s $f2 ,$f2, $f6
mov.s $f12, $f2
syscall
li $v0, 4
la $a0, mi
syscall
li $v0, 2
mov.s $f12, $f4
syscall
li $v0, 4
la $a0, ma
syscall
li $v0, 2
mov.s $f12, $f5
syscall
