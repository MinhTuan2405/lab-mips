# CÂU 2.2
# int Sum = 0
# for (int i = 1; i <=N; ++i){
#      Sum = Sum + i;
# }

# (V?i giá tr? c?a i, N, Sum l?n l??t ch?a trong các thanh ghi $s0, $s1, $s2)

addi $s2, $0, 0 # Sum
addi $s1, $0, 4 # N
addi $s0, $0, 1 # i

loop:
	sle  $t1, $s0, $s1
	beq $t1, $zero, exit
	add $s2, $s2, $s0
	addi $s0, $s0, 1
	j loop
	
exit: