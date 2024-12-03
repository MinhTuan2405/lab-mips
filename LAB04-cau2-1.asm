# CAU 2.1
# Chuy?n ?o?n code trong b?ng theo sau sang MIPS v� s? d?ng MARS ?? ki?m tra l?i k?t qu?:
# if (i == j)
#    f = g + h;
# else
#    f = g � h;

# (V?i gi� tr? c?a i, j, f, g, h l?n l??t ch?a trong c�c thanh ghi $s0, $s1, $s2, $t0, $t1)
# kh?i t?o gi� tr? tr? i, j, g, h
addi $s0, $0, 5 # i
addi $s1, $0, 5  # j
addi $t0, $0, 2 # g
addi $t1, $0, 4 # h

bne $s0, $s1, else
if: 
	add $s2, $t0, $t1
	j exit

else:
	sub $s2, $t0, $t1
exit:
	
# c�ch kh�c vi?t theo if (i != j)
# beq $s0, $s1, else1
# sub $s2, $t0, $t1
# j exit1

# else1:
#	add $s2, $t0, $t1
# exit1: 