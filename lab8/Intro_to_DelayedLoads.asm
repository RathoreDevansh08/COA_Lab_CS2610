.data
num1:​ ​ .word​ ​ 2 ​            //taking num1 as a word.
num2:​ ​ .word​ ​ 3 ​            //taking num2 as a word.
s3:​ .asciiz ​ "t3 : "​        //taking ascii strings for printing final results.
s4:​ .asciiz ​ "\nt4 : "

.text
lw ​ $ ​ t1​ , num1            //provided code snippet.
lw ​ $ ​ t2​ , num2
lw ​ $ ​ t1​ , num2
add ​ $ ​ t3​ , $​ t1​ , $​ 0
add ​ $ ​ t4​ , $​ t1​ , $​ 0
li $​ v0​ , 4                 //for printing ascii string ​ s3​ .
la $​ a0​ , s3
syscall
li $​ v0​ , ​ 1 ​               //for printing value of ​ t3​ .
move ​ $ ​ a0​ , $​ t3
syscall
li $​ v0​ , ​ 4 ​               //for printing ascii string ​ s4​ .
la $​ a0​ , ​ s4
syscall
li $​ v0​ , ​ 1 ​               //for printing value of ​ t4​ .
move ​ $ ​ a0​ , $​ t4
syscall
li $​ v0​ , ​ 10
syscall
