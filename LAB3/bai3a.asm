.data
ms1: .asciiz "Nhap so phan tu cua mang Array(>0): "
ms2: .asciiz "Array["
ms3: .asciiz "]: "
ms4: .asciiz "Gia tri lon nhat cua mang: "
ms5: .asciiz "\nGia tri nho nhat cua mang: "
ms6: .asciiz "\nTong gia tri cua cac phan tu trong mang: "
ms7: .asciiz "\nNhap chi so i can truy xuat: "
ms8: .asciiz "\nPhan tu can truy xuat khong hop le hay nhap lai: "
array: .word 0:250   #250 words =1000 bytes

.text
li $v0,4
la $a0,ms1
syscall

li $v0,5
syscall
move $t0,$v0 #t0 lưu n
bgt $t0,$zero,input_value

input_value:
li $t6,0
la $t1,array
li $t2,0

input_loop:
beq $t2,$t0,max_min
#A[
li $v0,4
la $a0,ms2
syscall

#i 
li $v0,1
move $a0,$t2
syscall

# ]: 
li $v0,4
la $a0,ms3
syscall

li $v0,5
syscall
sw $v0,0($t1)

addi $t1,$t1,4
addi $t2,$t2,1
j input_loop

max_min:
la $t1,array
lw $t3,0($t1)
move $t4,$t3   #max=A[0]
move $t5,$t3   #min=A[0]
#chi den phu tu A[1]
li $t2,1
add $t1,$t1,4

sum_min_max_loop:
add $t6,$t6,$t3
beq $t2,$t0,output
lw $t3,0($t1)
bgt $t3,$t4,update_max
blt $t3,$t5,update_min
j update_i

update_i:
add $t1,$t1,4
add $t2,$t2,1
j sum_min_max_loop

update_max:
move $t4,$t3
j update_i
update_min:
move $t5,$t3
j update_i

output:
#gia tri lon nhat
li $v0,4
la $a0,ms4
syscall

li $v0,1
move $a0,$t4
syscall

#gia tri nho nhat
li $v0,4
la $a0,ms5
syscall

li $v0,1
move $a0,$t5
syscall

#tong gia tri cua mang
li $v0,4
la $a0,ms6
syscall

li $v0,1
move $a0,$t6
syscall

j input_output

input_output:
li $v0,4
la $a0,ms7
syscall

loop_input:
li $v0,5
syscall
move $s1,$v0

check_input:
blt $s1,$zero,error
bge $s1,$t0,error
j print_nums

error:
li $v0,4
la $a0,ms8
syscall

j loop_input

print_nums:
li $v0,4
la $a0,ms2
syscall

li $v0,1
move $a0,$s1
syscall

li $v0,4
la $a0,ms3
syscall

la $t1,array
sll $s1,$s1,2
add $t1,$t1,$s1
lw $t2,0($t1)

li $v0,1
move $a0,$t2
syscall
j exit

exit:
li $v0, 10
syscall










