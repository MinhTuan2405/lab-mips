.data
    prompt1:    .asciiz "so thu nhat: "
    prompt2:    .asciiz "so thu hai: "
    result1:    .asciiz "so lon hon: "
    result2:    .asciiz "\ntong: "
    result3:    .asciiz "\nhieu: "
    result4:    .asciiz "\ntich: "
    result5:    .asciiz "\nthuong: "
    newline:    .asciiz "\n"

.text
main:
    # Nh?p s? th? nh?t
    li $v0, 4              # System call for printing string
    la $a0, prompt1        # Load address of prompt1
    syscall

    li $v0, 5              # System call for reading integer
    syscall
    move $t0, $v0          # L?u s? vào $t0

    # Nh?p s? th? hai
    li $v0, 4              # System call for printing string
    la $a0, prompt2        # Load address of prompt2
    syscall

    li $v0, 5              # System call for reading integer
    syscall
    move $t1, $v0          # L?u s? vào $t1

    # So sánh hai s?
    bge $t0, $t1, print_greater_t0  # N?u $t0 >= $t1, in $t0
    move $t2, $t1                   # Ng??c l?i, $t2 = $t1
    j print_result                  # Nh?y ??n in k?t qu?

print_greater_t0:
    move $t2, $t0                   # $t2 = $t0

print_result:
    # In s? l?n h?n
    li $v0, 4
    la $a0, result1
    syscall

    li $v0, 1
    move $a0, $t2
    syscall

    # Tính toán và in k?t qu?
    # T?ng
    add $t3, $t0, $t1
    li $v0, 4
    la $a0, result2
    syscall

    li $v0, 1
    move $a0, $t3
    syscall

    # Hi?u
    sub $t4, $t0, $t1
    li $v0, 4
    la $a0, result3
    syscall

    li $v0, 1
    move $a0, $t4
    syscall

    # Tích
    mul $t5, $t0, $t1
    li $v0, 4
    la $a0, result4
    syscall

    li $v0, 1
    move $a0, $t5
    syscall

    # Th??ng
    beq $t1, $zero, skip_division  # Ki?m tra chia cho 0
    div $t0, $t1
    mflo $t6                       # L?y k?t qu? th??ng t? LO

    li $v0, 4
    la $a0, result5
    syscall

    li $v0, 1
    move $a0, $t6
    syscall

skip_division:
    # Xu?ng dòng
    li $v0, 4
    la $a0, newline
    syscall

    # Thoát ch??ng trình
    li $v0, 10
    syscall
