.data
msg1: .asciiz "Nhap vao so nguyen thu nhat: "
msg2: .asciiz "Nhap vao so nguyen thu hai: "
msg3: .asciiz "Tong cua 2 so nguyen la: "

.text
li $v0, 4         
la $a0, msg1
syscall

li $v0, 5          
syscall
add $t0, $v0, $zero 

li $v0, 4           
la $a0, msg2
syscall

li $v0, 5           
syscall
add $t1, $v0, $zero 

add $t2, $t0, $t1   

li $v0, 4           
la $a0, msg3
syscall

li $v0, 1           
add $a0, $t2, $zero
syscall