.data
str: .space 100
input: .asciiz "Nhap vao chuoi: "
.text

li $v0,4
la $a0,input
syscall 

li $v0,8
la $a0,str  #$a0=address(str)
la $a1,100 
syscall 

li $v0,4
la $a0,str
syscall


