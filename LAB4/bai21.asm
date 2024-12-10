#gangiatri
li $s0, 2
li $s1, 3
li $s2, 4
li $s3, 5
main:
move $a0,$s0
move $a1,$s1
move $a2,$s2
move $a3,$s3
jal proc_example
move $a0,$v0
li $v0,1
syscall
j exit
proc_example:
#push stack
addi $sp, $sp,-8
sw $s0, 0($sp)
sw $s1, 4($sp)

add $t0,$a0,$a1
add $t1,$a2,$a3
sub $s0,$t0,$t1

sub $t0,$a0,$a1
sub $t1,$a2,$a3
add $s1,$t0,$t1

move $v0,$s0
move $v1,$s1

#pop stack
lw $s0,0($sp)
lw $s1,4($sp)
addi $sp,$sp,4

jr $ra
exit:

