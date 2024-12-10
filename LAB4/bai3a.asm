.data 
Nhap: 	.asciiz "Nhap so n vao: "
Xuat: 	.asciiz "Gia tri cua "
Xuat1:	.asciiz "! la: "
.text
main: 	li        $v0, 4
    	la        $a0, Nhap
   	syscall   #In Nhap 
   	
    	li        $v0, 5
    	syscall   #Nhap vao n
    	move 	  $s2, $v0   # $s2=n
    	
    	move      $a0, $v0   
    	add       $a0,$a0,1
    
    	jal       fact       # nhay den ham giai thua  
      
    	move      $s1, $v0   # chuyen gia tri tra ve vao thanh ghi $s1  
    	li        $v0, 4
    	la        $a0, Xuat 
    	syscall
    	
    	addi 	  $a0, $s2, 0
    	li	  $v0, 1
    	syscall #Xuat int n
    	
    	la 	  $a0, Xuat1
    	li 	  $v0, 4
    	syscall #Xuat !la
    	
    	li        $v0, 1        
    	move      $a0, $s1        
    	syscall #Xuat n!
    	j exit
fact:   addi    $sp, $sp, -8 #tao vung nho cho stack de luu dia chi va gia tri tra ve
    	sw      $a0, 4($sp)   #luu $a0 vao stack
    	sw      $ra, 0($sp)   #luu $ra vao stack
    	bgtu    $a0,1,else    # neu n>=1 nhay den else
    	addi    $v0, $zero, 1    #return 1
    	j return                
    	
    	
    	
else:	addi    $a0, $a0, -1   # n = n - 1
    	jal     fact          # gia tri fact(n - 1) trong $v0
    	mulo    $v0, $v0 ,$a0 # return n * fact(n - 1)
   
return:	lw      $a0, 4($sp) # lay gia tri $a0 trong stack
    	lw      $ra, 0($sp) # lay gia tri $ra trong stack 
    	addi    $sp, $sp, 8 # giai phong vung nho cu trong stack
    	jr      $ra         # nhay den dia chi cau lenh sau cau lenh jal
exit: 
