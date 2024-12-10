.data
prompt: .asciiz "The factorial of 10 is: "
.text
main:
   
    li $v0,4               
    la $a0,prompt
    syscall
    
    li $a0,10              
    jal giaithua   
                            
    move $a0,$v0           
    li $v0,1               
    syscall
    j exit                 
giaithua:
    addi $sp,$sp,-8        
    sw $ra,0($sp)          
    sw $a0,4($sp)         
  
    ble $a0,$zero,nbehon1 
    addi $a0,$a0,-1        
    jal giaithua           

    lw $a0,4($sp)          
    mul $v0,$v0,$a0        
    j end_giaithua         
nbehon1:
    li $v0,1               
end_giaithua:
    lw $ra,0($sp)          
    addi $sp,$sp,8         
    jr $ra                
exit:
    
