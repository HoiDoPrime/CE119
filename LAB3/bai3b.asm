.data
ms1: .asciiz "Nhap so phan tu cua mang A(>0): "
ms2: .asciiz "  A["
ms3: .asciiz "]:"
ms4: .asciiz "\nNhap phan tu i: "
ms5: .asciiz "\nNhap phan tu j: "
ms6: .asciiz "Phan tu i khong hop le, nhap lai: "
ms7: .asciiz "Phan tu j khong hop le, nhap lai: "
ms8: .asciiz "Phan tu cuoi cung cua mang A sau khi set dieu kien: "
array: .word 0:250   #250 words =1000 bytes

.text
li $v0, 4
la $a0, ms1
syscall

li $v0, 5
syscall
move $t0, $v0  # $t0= n 
blez $t0, exit  

input_value:
li $t2, 0         
la $t1, array    

input_loop:
beq $t2, $t0, nhap_i  
# Print "A["
li $v0, 4
la $a0, ms2
syscall

# Print index i
li $v0, 1
move $a0, $t2
syscall

# Print "]: "
li $v0, 4
la $a0, ms3
syscall 
li $v0, 5
syscall
sw $v0, 0($t1)  

addi $t1, $t1, 4  
addi $t2, $t2, 1  
j input_loop

nhap_i:
li $v0, 4
la $a0, ms4
syscall

li $v0, 5
syscall
move $s0, $v0  

check_i:
blt $s0, 0, invalid_i
bge $s0, $t0, invalid_i
j nhap_j  

invalid_i:
li $v0, 4
la $a0, ms6
syscall
j nhap_i  

nhap_j:
li $v0, 4
la $a0, ms5
syscall

li $v0, 5
syscall
move $s1, $v0  

check_j:
blt $s1, 0, invalid_j
bge $s1, $t0, invalid_j
j sosanh  

invalid_j:
li $v0, 4
la $a0, ms7
syscall
j nhap_j 

sosanh:
blt $s0, $s1, set_Ai_i
j set_Ai_j

# Set A[i] to i
set_Ai_i:
la $s3, array
sll $t1, $s0, 2
add $t1, $t1, $s3
sw $s0, 0($t1)
j set_A

# Set A[i] to j
set_Ai_j:
la $s3, array
sll $t1, $s0, 2
add $t1, $t1, $s3
sw $s1, 0($t1)
j set_A

set_A:
li $v0, 4
la $a0, ms8
syscall

la $s3, array
li $t3, 0   

print_A:
bge $t3, $t0, exit

li $v0, 4
la $a0, ms2
syscall

li $v0, 1
move $a0, $t3
syscall

li $v0, 4
la $a0, ms3
syscall

lw $a0, 0($s3)
li $v0, 1
syscall

addi $t3, $t3, 1  
addi $s3, $s3, 4  
j print_A

exit:
li $v0, 10
syscall
