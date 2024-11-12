beq $s0,$s1,ifequal
sub $s2,$t0,$t1
j endif
ifequal:
add $s2,$t0,$t1
endif:
li $v0,10
syscall

