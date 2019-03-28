.data
E: .asciiz "Please enter a floating point number : "
W: .asciiz "You have entered : "
fl:​ .float 0.0

.text
main:
lwc1 ​ $f4, fl

# Printing out the text for E
li $​ v0​ , ​ 4
la $​ a0​ , E
syscall

# Getting user input for float value
li $​ v0​ , ​ 6
syscall

# Printing out the W text
li $​ v0​ , ​ 4
la $​ a0​ , W
syscall

# Printing the float
li $​ v0​ , ​ 2add.s ​ $f12, $f0, $f4
syscall

# End Program
li $​ v0​ , ​ 10
syscall
