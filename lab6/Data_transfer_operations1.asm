.data
F: ​ .word​ ​ 0xF
A: ​ .word​ ​ 0xA
.text
lw ​ $ ​ t0​ , F
lw ​ $ ​ t1​ , F
lw ​ $ ​ t2​ , F
lw ​ $ ​ t3​ , F
lw ​ $ ​ t4​ , F
lw ​ $ ​ t5​ , F
lw ​ $ ​ t6​ , F
lw ​ $ ​ t7​ , F
lw ​ $ ​ t8​ , F
lw ​ $ ​ t9​ , F
lw ​ $ ​ s0​ , A
lw ​ $ ​ s1​ , A
lw ​ $ ​ s2​ , A
lw ​ $ ​ s3​ , A
lw ​ $ ​ s4​ , A
lw ​ $ ​ s5​ , A
lw ​ $ ​ s6​ , A
lw ​ $ ​ s7​ , A
move ​ $ ​ s4​ , $​ t6
move ​ $ ​ t5​ , $​ s7
syscall
