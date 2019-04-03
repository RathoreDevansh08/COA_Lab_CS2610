.data  
arr: .space 100			#creating extra space for temp. differences to be stored.  
str0: .asciiz "TEMPERATURE DIFFERENCE CALCULATOR::\n"
str1: .asciiz "\nEnter temperature: "
str2: .asciiz "\nTemperature Differences: "
str3: .asciiz "\n"

.text
la $s0, arr                   #loading address of initial array.
move $s1, $s0                 #copying address to another location.
#Initializing temp. difference to a non-zero value so that it 
#can enter the loop.
addi $t0, $zero, 1  
#Initializing $t2 to zero which will store the number of elements #in the array. 
add $t2, $zero, $zero 

li $v0, 4                     #printing Heading.
la $a0, str0
syscall 

add $t7, $zero, 1
add $t8, $zero, 1
add $t9, $zero, 1
add $t6, $zero, 1

loop:
beq $t6, $zero, end           #Condition to exit loop, when difference=0.
next:
li $v0, 4                     #printing string to request input.
la $a0, str1 
syscall
li $v0, 5                     #taking input for temperature.
syscall
move $t1, $v0

addi $t0, $t1, -20            #calculating difference from 20degreeC.
sw $t0, 0($s0)                #storing temperature difference in memory.
add $s0, $s0, 4               #incrementing the address.
addi $t2, $t2, 1              #incrementing the number of elements in array.

move $t7, $t8
move $t8, $t9
move $t9, $t0
or $t6, $t7, $t8
or $t6, $t6, $t9
j loop

end:  	   		      #end module to print the array
add $t3, $zero, $zero  
li $v0, 4   
la $a0, str2
syscall
loop2:   			      #printing loop module
beq $t3, $t2, exit    	      #condition for terminating the printing loop.

li $v0, 4    
la $a0, str3
syscall
li $v0, 1        		      #printing array elements.
lw $a0, 0($s1)
add $s1, $s1, 4
syscall 
add $t3, $t3, 1  
j loop2
syscall

exit:                         #exit module
li $v0, 10                    #terminating the program.
syscall
