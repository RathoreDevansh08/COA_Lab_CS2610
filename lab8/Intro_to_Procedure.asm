.data
x: ​ .word​ 2                  //two numbers taken as word.
y: ​ .word​ 3

.text
la $​ t0​ , x                  //loading ​ address ​ of each of the two numbers
la $​ t1​ , y                  //in two ​ different ​ registers.
and ​ $ ​ t2​ , $​ t2​ , $​ zero​   //initializing the loop index to ​ 0 .
lw ​ $ ​ t3​ , ​ 0 ​ ($​ t1​ )      //initializing the loop termination index as the value of power.
lw ​ $ ​ t4​ , ​ 0 ​ ($​ t0​ )      //taking value of x in a register for ​ multiplication ​ in loop.
addi ​ $ ​ s0​ , $​ zero​ , ​ 1 ​   //initializing the product as ​ 1 ​ .

loop:​                        //loop module
beq ​ $ ​ t2​ , $​ t3​ , end      //comparing loop index with termination index.
addi ​ $ ​ t2​ , $​ t2​ , ​ 1 ​     //incrementing loop index.
jal ​ power                   //calling module power.
j ​ loop                      //continuing the loop.

end:
li $​ v0​ , ​ 10​                //for terminating the program.
syscall

power:
mul ​ $ ​ s0​ , $​ s0​ , $​ t4​     //for multiplying ​ the current product with x value.
jr ​ $ ​ ra​                    //returning ​ back to loop.
