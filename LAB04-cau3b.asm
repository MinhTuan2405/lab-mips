.data
prompt:     .asciiz "Nhap so nguyen duong: "
invalid:    .asciiz "Invalid Entry\n"
space:      .asciiz " "
zero:       .asciiz "Zero"
one:        .asciiz "One"
two:        .asciiz "Two"
three:      .asciiz "Three"
four:       .asciiz "Four"
five:       .asciiz "Five"
six:        .asciiz "Six"
seven:      .asciiz "Seven"
eight:      .asciiz "Eight"
nine:       .asciiz "Nine"
b:          .space 100

.text
main:
    # In ra th�ng b�o y�u c?u nh?p s?
    li $v0, 4
    la $a0, prompt
    syscall

    # Nh?p s? nguy�n d??ng
    li $v0, 5
    syscall
    move $t0, $v0  # L?u s? nh?p v�o trong $t0

    # Ki?m tra s? c� ph?i l� nguy�n d??ng kh�ng
    blez $t0, invalid_entry

    # Lo?i b? c�c s? 0 ? ??u v� l?u v�o m?ng b
    li $t1, 0      # Kh?i t?o ch? s? m?ng b
    li $t2, 10     # Kh?i t?o bi?n chia cho 10
process_digits:
    beqz $t0, end_process_digits  # N?u t0 l� 0, k?t th�c qu� tr�nh x? l�
    div $t0, $t2
    mfhi $t3          # L?y ph?n d? (ch? s? cu?i c�ng)
    sb $t3, b($t1)    # L?u ch? s? v�o m?ng b
    addi $t1, $t1, 1  # T?ng ch? s? m?ng b
    mflo $t0          # L?y ph?n nguy�n c?a ph�p chia
    j process_digits

end_process_digits:
    sub $t1, $t1, 1   # Gi?m ch? s? ?? duy?t m?ng b t? cu?i l�n

print_digits:
    lb $t3, b($t1)    # L?y ch? s? t? m?ng b

    # L?y ??a ch? c?a t? t??ng ?ng
    la $a0, zero      # Gi? s? ch? s? l� 0
    beqz $t3, print_word
    li $t4, 1
    beq $t3, $t4, load_one
    li $t4, 2
    beq $t3, $t4, load_two
    li $t4, 3
    beq $t3, $t4, load_three
    li $t4, 4
    beq $t3, $t4, load_four
    li $t4, 5
    beq $t3, $t4, load_five
    li $t4, 6
    beq $t3, $t4, load_six
    li $t4, 7
    beq $t3, $t4, load_seven
    li $t4, 8
    beq $t3, $t4, load_eight
    li $t4, 9
    beq $t3, $t4, load_nine

load_one:
    la $a0, one
    j print_word
load_two:
    la $a0, two
    j print_word
load_three:
    la $a0, three
    j print_word
load_four:
    la $a0, four
    j print_word
load_five:
    la $a0, five
    j print_word
load_six:
    la $a0, six
    j print_word
load_seven:
    la $a0, seven
    j print_word
load_eight:
    la $a0, eight
    j print_word
load_nine:
    la $a0, nine

print_word:
    li $v0, 4
    syscall

    # In kho?ng tr?ng n?u kh�ng ph?i l� ch? s? cu?i c�ng
    sub $t1, $t1, 1
    bgez $t1, print_space
    j exit

print_space:
    li $v0, 4
    la $a0, space
    syscall
    bgez $t1, print_digits

exit:
    # K?t th�c ch??ng tr�nh
    li $v0, 10
    syscall

invalid_entry:
    # In ra th�ng b�o "Invalid Entry"
    li $v0, 4
    la $a0, invalid
    syscall

    # K?t th�c ch??ng tr�nh
    li $v0, 10
    syscall
