.data
  nhap1: .asciiz "Nhap so nguyen thu nhat  "    
  nhap2: .asciiz "Nhap so nguyen thu hai  "
  ketqua1: .asciiz "\nSo lon hon: "
  ketqua2: .asciiz "\nTong hai so: "
  ketqua3: .asciiz "\nHieu hai so: "
  ketqua4: .asciiz "\nTich hai so: "
  ketqua5: .asciiz "\nThuong hai so: "
 .text
  li $v0,4
  la $a0,nhap1
  syscall
  
  li $v0,5
  syscall 
  move $t0,$v0
  
  li $v0,4
  la $a0,nhap2
  syscall
  
  li $v0,5
  syscall
  move $t1,$v0
  #so lon hon
  slt $at,$t1,$t0
  bne $at,$zero,t0lonhon
  #bge $t0,$t1,t0lonhon
  move $t2,$t1
  j insolonhon
  
t0lonhon:
  move $t2,$t0
  j insolonhon
  
insolonhon:
  li $v0,4
  la $a0,ketqua1
  syscall
  
  li $v0,1
  move $a0,$t2
  syscall
  
  #tong
  add $t3,$t0,$t1
  li $v0,4
  la $a0,ketqua2
  syscall
  li $v0,1
  move $a0,$t3
  syscall
  
  #hieu
  sub $t4,$t0,$t1
  li $v0,4
  la $a0,ketqua3
  syscall
  li $v0,1
  move $a0,$t4
  syscall
  
  #tich
  mul $t5,$t0,$t1
  li $v0,4
  la $a0,ketqua4
  syscall
  li $v0,1
  move $a0,$t5
  syscall
  
  #thuong
  beq $t1,$zero,ketthuc
  div $t6,$t0,$t1
  
  li $v0,4
  la $a0,ketqua5
  syscall
  
  li $v0,1
  move $a0,$t6
  syscall
  j ketthuc
ketthuc:
  li $v0,10
  syscall
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
