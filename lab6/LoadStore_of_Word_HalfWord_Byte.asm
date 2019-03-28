.data
str1:​ .ascii​ "123456789abcedef"
str2:​ .ascii​ "123456789ABCDEF"

.text
la $​ s0​ , str1
la $​ s2​ , str2
lb ​ $t0​ , 0($​s0​)
lb ​ $t1​ , 1($​s0)
lb ​ $t2​ , 2($​s0​)
lb ​ $t3​ , 12($s2)
lb ​ $t4​ , 13($s2)
lb ​ $t5​ , 14($s2)
lh ​ $t6​ , 0($s2)
lh ​ $t7​ , 2($s2)
lh ​ $t8​ , 14($s0)
lw ​ $t9​ , 12($s2)
lw ​ $s1​ , 12($s0)
syscall
