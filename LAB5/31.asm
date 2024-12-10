add $t1,$t2,$t3

addi $t1,$t1,5

sub $t1,$t2,$3

li $t2,0x10010000
lw $t1,4($t2)

li $t2,0x10010020
sw  $t1,8($t2)

j label 
label:
li $v0,10
syscall

slt $t1,$t2,$t3

