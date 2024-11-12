li $s2,0
li $s0,1

loop:
#bgt $s0,$s1,end
slt $at,$t1,$s0
beq $at,$zero,end

add $s2,$s2,$s0
addi $s0,$s0,1
j loop

end:
li $v0,10
syscall
