.data
text:​ .asciiz ​ "My roll number is : "
roll:​ ​ .word​ ​ 111701011

.text
main:
# Printing out the text
li $​ v0​ , ​ 4
la $​ a0​ , text
syscall

# Printing the roll no.
li $​ v0​ , ​ 1
lw ​ $ ​ a0​ , roll
syscall

# End Program
li $​ v0​ , ​ 10
syscall
