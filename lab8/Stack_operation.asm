.data
array:​ ​ .word​ ​ 1 ​ ​ 2 ​ ​ 3 ​ ​ 4 ​     //storing elements of ​ 2 ​ x2 matrix in an
array.

.text
la $​ t0​ , array                   //loading ​ address ​ of starting index of
array.
lw ​ $ ​ t1​ , ​ 0($​ t0​ )           //storing values of ​ 2 ​ x2 matrix in ​ different
registers.lw ​ $ ​ t2​ , 4($​ t0​ )
lw ​ $ ​ t3​ , 8($​ t0​ )
lw ​ $ ​ t4​ , 12​ ($​ t0​ )
jal ​ det                          //calling determinant(det) procedure.

exit:​                             //exit procedure
li $​ v0​ , ​ 1 ​                     //for printing the final result
move ​ $ ​ a0​ , $​ s2
syscall
li $​ v0​ , ​ 10​                     //for terminating the program.
syscall

det:​                              //determinant(det) procedure.
mul ​ $ ​ s0​ , $​ t1​ , $​ t4​          //carrying out the requiredcalculations.
mul ​ $ ​ s1​ , $​ t2​ , $​ t3
sub ​ $ ​ s2​ , $​ s0​ , $​ s1
jal ​ exit                         //calling exit once done.
