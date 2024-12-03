# a. Nh?p v�o m?t k� t?, xu?t ra c?a s? I/O c?a MARS theo t?ng y�u c?u sau:

# K� t? li?n tr??c v� li?n sau c?a k� t? nh?p v�o
# V� d?:
# Nhap ky tu (ch? m?t k� t?): b
# Ky tu truoc: a
# Ky tu sau: c

# K� t? nh?p v�o ch? ???c ph�p l� ba lo?i: s?, ch? th??ng v� ch? hoa. N?u k� t? nh?p v�o r?i v�o m?t trong ba lo?i, 
# xu?t ra c?a s? ?� l� lo?i n�o; n?u k� t? nh?p kh�ng r?i v�o m?t trong ba lo?i tr�n, xu?t ra th�ng b�o �invalid type�


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
    # In th�ng b�o nh?p
    li $v0, 4                  # syscall: print string
    la $a0, yecau          
    syscall

    # Nh?p k� t?
    li $v0, 12                 # syscall: read character
    syscall
    move $t0, $v0              # L?u k� t? v�o $t0
    
    # L?y k� t? tr??c v� sau
    addi $t1, $t0, -1          # K� t? tr??c, gi?m m� ASCII xu?ng 1
    addi $t2, $t0, 1           # K� t? sau, t?ng m� ASCII l�n 1
    
     # In d�ng 'k� t? tr??c'
    li $v0, 4                  # syscall: print string
    la $a0, kitutruoc        	
    syscall
    # in k� t? tr??c 
    li $v0, 11                 # syscall: print character
    move $a0, $t1              
    syscall

    # In d�ng 'k� t? sau'
    li $v0, 4                  # syscall: print string
    la $a0, kitusau       
    syscall
    # In k� t? sau
    li $v0, 11                 # syscall: print character
    move $a0, $t2              
    syscall
    
    
    # Ki?m tra lo?i k� t?
    # lo?i s?
    li $t3, 48                 # ASCII '0'
    li $t4, 57                 # ASCII '9'
    # Lo?i ch? hoa 
    li $t5, 65                 # ASCII 'A'
    li $t6, 90                 # ASCII 'Z'
    # Lo?i ch? th??ng 
    li $t7, 97                 # ASCII 'a'
    li $t8, 122                # ASCII 'z'

    
     # Ki?m tra n?u l� s?
    blt $t0, $t3, check_lower  # N?u k� t? < '0', ki?m tra ti?p
    bgt $t0, $t4, check_lower  # N?u k� t? > '9', ki?m tra ti?p
    li $v0, 4                  # syscall: print string
    la $a0, so        		# In lo?i: s?
    syscall
    j exit                      

check_lower:
    # Ki?m tra n?u l� ch? th??ng
    blt $t0, $t7, check_upper  	# N?u k� t? < 'a', ki?m tra ti?p
    bgt $t0, $t8, check_upper  	# N?u k� t? > 'z', ki?m tra ti?p
    li $v0, 4                  	# syscall: print string
    la $a0, chuthuong         	# In lo?i: ch? th??ng
    syscall
    j exit                    

check_upper:
    # Ki?m tra n?u l� ch? hoa
    blt $t0, $t5, invalid_type 	# N?u k� t? < 'A', kh�ng h?p l?
    bgt $t0, $t6, invalid_type 	# N?u k� t? > 'Z', kh�ng h?p l?
    li $v0, 4                  	# syscall: print string
    la $a0, chuhoa         	# In lo?i: ch? hoa
    syscall
    j exit                     

invalid_type:
    # Th�ng b�o lo?i kh�ng h?p l?
    li $v0, 4                  # syscall: print string
    la $a0, invalid            
    syscall

exit:

    
    
    