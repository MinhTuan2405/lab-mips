# a. Nh?p vào m?t ký t?, xu?t ra c?a s? I/O c?a MARS theo t?ng yêu c?u sau:

# Ký t? li?n tr??c và li?n sau c?a ký t? nh?p vào
# Ví d?:
# Nhap ky tu (ch? m?t ký t?): b
# Ky tu truoc: a
# Ky tu sau: c

# Ký t? nh?p vào ch? ???c phép là ba lo?i: s?, ch? th??ng và ch? hoa. N?u ký t? nh?p vào r?i vào m?t trong ba lo?i, 
# xu?t ra c?a s? ?ó là lo?i nào; n?u ký t? nh?p không r?i vào m?t trong ba lo?i trên, xu?t ra thông báo “invalid type”


.data
yecau:       	.asciiz "Nhap ky tu (chi mot ky tu): "  
kitutruoc:    	.asciiz "\nKy tu truoc: "              
kitusau:    	.asciiz "\nKy tu sau: "               
so:  		.asciiz "\nLoai: So"                   
chuthuong:   	.asciiz "\nLoai: Chu thuong"           
chuhoa:   	.asciiz "\nLoai: Chu hoa"              
invalid:      	.asciiz "\ninvalid type"            

.text
main:
    # In thông báo nh?p
    li $v0, 4                  # syscall: print string
    la $a0, yecau          
    syscall

    # Nh?p ký t?
    li $v0, 12                 # syscall: read character
    syscall
    move $t0, $v0              # L?u ký t? vào $t0
    
    # L?y kí t? tr??c và sau
    addi $t1, $t0, -1          # Ký t? tr??c, gi?m mã ASCII xu?ng 1
    addi $t2, $t0, 1           # Ký t? sau, t?ng mã ASCII lên 1
    
     # In dòng 'kí t? tr??c'
    li $v0, 4                  # syscall: print string
    la $a0, kitutruoc        	
    syscall
    # in kí t? tr??c 
    li $v0, 11                 # syscall: print character
    move $a0, $t1              
    syscall

    # In dòng 'kí t? sau'
    li $v0, 4                  # syscall: print string
    la $a0, kitusau       
    syscall
    # In kí t? sau
    li $v0, 11                 # syscall: print character
    move $a0, $t2              
    syscall
    
    
    # Ki?m tra lo?i ký t?
    # lo?i s?
    li $t3, 48                 # ASCII '0'
    li $t4, 57                 # ASCII '9'
    # Lo?i ch? hoa 
    li $t5, 65                 # ASCII 'A'
    li $t6, 90                 # ASCII 'Z'
    # Lo?i ch? th??ng 
    li $t7, 97                 # ASCII 'a'
    li $t8, 122                # ASCII 'z'

    
     # Ki?m tra n?u là s?
    blt $t0, $t3, check_lower  # N?u ký t? < '0', ki?m tra ti?p
    bgt $t0, $t4, check_lower  # N?u ký t? > '9', ki?m tra ti?p
    li $v0, 4                  # syscall: print string
    la $a0, so        		# In lo?i: s?
    syscall
    j exit                      

check_lower:
    # Ki?m tra n?u là ch? th??ng
    blt $t0, $t7, check_upper  	# N?u ký t? < 'a', ki?m tra ti?p
    bgt $t0, $t8, check_upper  	# N?u ký t? > 'z', ki?m tra ti?p
    li $v0, 4                  	# syscall: print string
    la $a0, chuthuong         	# In lo?i: ch? th??ng
    syscall
    j exit                    

check_upper:
    # Ki?m tra n?u là ch? hoa
    blt $t0, $t5, invalid_type 	# N?u ký t? < 'A', không h?p l?
    bgt $t0, $t6, invalid_type 	# N?u ký t? > 'Z', không h?p l?
    li $v0, 4                  	# syscall: print string
    la $a0, chuhoa         	# In lo?i: ch? hoa
    syscall
    j exit                     

invalid_type:
    # Thông báo lo?i không h?p l?
    li $v0, 4                  # syscall: print string
    la $a0, invalid            
    syscall

exit:

    
    
    