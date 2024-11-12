.data
  ms1: .asciiz "\nNhap ki tu: "
  ms2: .asciiz "\nKy tu so."
  ms3: .asciiz "\nKy tu chu thuong."
  ms4: .asciiz "\nKy tu chu hoa."
  ms5: .asciiz "\ninvalid type."
  ms6: .asciiz "\nKi tu lien truoc: "
  ms7: .asciiz "\nKi tu lien sau: "
.text 
  li $v0,4
  la $a0,ms1
  syscall
  
  li $v0,12
  syscall 
  move $t0,$v0
  
  li $t1,48 
  li $t2,57
  
  # Kiểm tra nếu $t0 < $t1 hoặc $t0 > $t2
  slt $at, $t0, $t1
  bne $at, $zero, check_lower
  slt $at, $t2, $t0
  bne $at, $zero, check_lower
  
  li $v0,4
  la $a0,ms2
  syscall
  j inkytu
  
check_lower:
  li $t3,97
  li $t4,123
  
  # Kiểm tra nếu $t0 < $t3 hoặc $t0 > $t4
  slt $at, $t0, $t3
  bne $at, $zero, check_upper
  slt $at, $t4, $t0
  bne $at, $zero, check_upper
  
  li $v0,4
  la $a0,ms3
  syscall
  j inkytu
  
check_upper:
  li $t5,65
  li $t6,90
  
  # Kiểm tra nếu $t0 < $t5 hoặc $t0 > $t6
  slt $at, $t0, $t5
  bne $at, $zero, invalid
  slt $at, $t6, $t0
  bne $at, $zero, invalid
  
  li $v0,4
  la $a0,ms4
  syscall 
  j inkytu
  
invalid:
  li $v0,4
  la $a0,ms5
  syscall
  j end
  
inkytu:
  li $v0,4
  la $a0,ms6
  syscall
  
  sub $t1, $t0, 1
  li $v0, 11
  move $a0, $t1
  syscall
  
  li $v0,4
  la $a0,ms7
  syscall
  
  add $t2, $t0, 1
  li $v0, 11
  move $a0, $t2
  syscall
  
  j end
  
end:
  li $v0, 10
  syscall

  
  
 
