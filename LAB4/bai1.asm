.data
prompt : .asciiz "Enter one number: "
.text
main:

jal getInt
move $s0,$v0
j exit

getInt:
li $v0,4
la $a0,prompt
syscall

li $v0, 5
syscall
jr $ra

exit:
