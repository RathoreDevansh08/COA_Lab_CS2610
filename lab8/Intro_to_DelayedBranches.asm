.data
n: ​ .word​ ​ 5 ​              //taking n as a word.

.text

main:​                      //main module
la $​ t0​, n                 //loading ​ address ​ of n.
lw ​$t1​, 0($​t0​)             //storing value of n in a register.
add ​$t2​, $​zero​, $​zero​      //initializing loop index to ​ zero​ .
add ​$s0​, $​zero​, $​zero​      //storing initial sum as ​ zero​ .

loop:
beq ​ $ ​ t2​ , $​ t1​ , end
addi ​ $ ​ t2​ , $​ t2​ , ​ 1 ​   //incrementing loop index ​ by ​ one.
mul ​ $ ​ t3​ , $​ t2​ , $​ t2​   //taking square of loop index into another register.
add ​ $ ​ s0​ , $​ s0​ , $​ t3​   //​ adding ​ the square to sum register.
j ​ loop                    //continuing the loop.

end:​                       //end module
li $​ v0​ , ​ 1 ​              //for printing the sum as a word.
move ​ $ ​ a0​ , $​ s0
syscall
li $​ v0​ , ​ 10​              //for terminating the program.
syscall
