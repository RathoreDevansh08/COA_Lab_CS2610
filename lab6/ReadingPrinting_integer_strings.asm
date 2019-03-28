.data
buffer: ​ .space 30
Ename:​ .asciiz "Enter your name: "
Eroll:​ .asciiz "Enter your roll no.: "
tname:​ .asciiz "Your name is : "
troll:​ .asciiz "Your roll no. is : "

.text
main:
# Printing out the text for name
li $​ v0​ , ​ 4
la $​ a0​ , Ename
syscall

# Getting user input
li $​ v0​ , ​ 8 ​       #to take string input
la $​ a0​ , ​ buffer ​ ​ #load byte space into address
li $​ a1​ , ​ 30       #allot byte space for string
move ​ $ ​ t0​ , $​ a0  #save string to t0
syscall             

# Printing out the text for rollno
li $​ v0​ , ​ 4
la $​ a0​ , Eroll
syscall             

# Getting user input
li $​ v0​ , ​ 5
syscall
move ​ $s1​ , $​v0

# Printing out the name text
li $​ v0​ , ​ 4
la $​ a0​ , tname
syscall

# Printing the name
li $​ v0​ , ​ 4
la $​ a0​ , ​ buffer ​ ​ #reload byte space to primary address
move ​ $ ​ a0​ , $​ t0  #move t0 value to primary address
syscall

# Printing out the roll no. text
li $​ v0​ , ​ 4
la $​ a0​ , troll
syscall

# Printing the roll no.
li $​ v0​ , ​ 1
move ​ $ ​ a0​ , $​ s1
syscall

# End Program
li $​ v0​ , ​ 10
syscall
