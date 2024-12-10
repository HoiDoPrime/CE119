.data
	tb_nhap: .asciiz "Nhap vao so n: "
	tb_xuat: .asciiz "Chuoi Fibonacci tu 0 den so thu n là: \n"
	space: .asciiz " "
.text
main:
    li $v0, 4
    la $a0, tb_nhap
    syscall
    
    li $v0, 5
    syscall
    move $t0, $v0  #t0=n
    li $v0, 4
    la $a0, tb_xuat 
    syscall
    li $t1, 0  	#t1=0	
    li $t2, 1  #t2=1
    li $v0, 1
    move $a0, $t1 #in so 0	
    syscall
    li $v0, 4
    la $a0, space
    syscall  
 
    li $v0, 1
    move $a0, $t2 #in so 1
    syscall
    
    li $v0, 4
    la $a0, space
    syscall 
    
    addi $t0, $t0, -2   # giam n di 2 vi da in hai sô 0 va 1
    slti $t4, $t0,0
    bne $t4, $zero,exit  # n <= 0 thi thoat
    
    loop:
        add $t3, $t1, $t2   #so tiep theo bang hai so sau cong lai
        li $v0, 1
        move $a0, $t3      
        syscall #in ra so vua tinh duoc

	li $v0, 4
	la $a0, space
	syscall 
	
        move $t1, $t2      #cap nhat lai so t1 = t2
        move $t2, $t3      #cap nhat lai so t2 = t3
        
        addi $t0, $t0, -1   #giam n đi 1
        
        slt $t4,$zero,$t0
        bne $t4,$zero,loop
        j exit       #neu n > 0 thi tiep tuc vong lap
    exit:
