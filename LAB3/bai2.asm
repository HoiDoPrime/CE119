.data
array1: .word 5, 6, 7, 8, 1, 2, 3, 9, 10, 4
size1: .word 10
array2: .byte 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
size2: .word 16
array3: .space 8
size3: .word 8

ms1: .asciiz "\nArray1: "
ms2: .asciiz "\nArray2: "
ms3: .asciiz "\nArray3: "
ms4: .asciiz "\nArray (1, 2, or 3): "
ms5: .asciiz "\nIndex: "
ms6: .asciiz "\nKet qua: "
ms7: .asciiz "\nMang nhap vao khong hop le."
ms8: .asciiz "\nDia chi mang nhap vao khong hop le."
.text

main:
    # In Array1 bằng con trỏ
    li $v0, 4
    la $a0, ms1
    syscall
    la $t0, array1      # Con trỏ tới phần tử đầu tiên của array1
    lw $t1, size1
    li $t2, 0
print_array1:
    bge $t2, $t1, set_array2
    lw $a0, 0($t0)      # Lấy giá trị từ địa chỉ mà con trỏ trỏ tới
    li $v0, 1
    syscall
    addi $t0, $t0, 4    # Tăng con trỏ lên 4 byte để trỏ tới phần tử tiếp theo
    addi $t2, $t2, 1
    j print_array1

# In Array2 bằng con trỏ
set_array2:
    li $v0, 4
    la $a0, ms2
    syscall
    la $t3, array2      # Con trỏ tới phần tử đầu tiên của array2
    lw $t4, size2
    li $t5, 0
print_array2:
    bge $t5, $t4, set_array3
    lb $a0, 0($t3)      # Sử dụng `lb` vì array2 là mảng byte
    li $v0, 1
    syscall
    addi $t3, $t3, 1    # Tăng con trỏ lên 1 byte để trỏ tới phần tử tiếp theo
    addi $t5, $t5, 1
    j print_array2

# Tính toán và gán giá trị cho Array3 bằng con trỏ
set_array3:
    la $t6, array2      # Con trỏ tới phần tử đầu tiên của array2
    lw $t7, size2
    la $t8, array3      # Con trỏ tới phần tử đầu tiên của array3
    li $t9, 0           # Biến đếm cho array3
set_element_array3:
    lw $t1, size3
    bge $t9, $t1, nhap_xuat

    lb $a0, 0($t6)                  # Lấy array2[i] thông qua con trỏ
    sub $t2, $t7, $t9
    sub $t2, $t2, 1
    lb $a1, array2($t2)             # Lấy array2[size2 - 1 - i]
    add $a0, $a0, $a1               # Tính array3[i] = array2[i] + array2[size2 - 1 - i]
    sb $a0, 0($t8)                  # Gán vào array3[i]

    addi $t6, $t6, 1                # Tăng con trỏ array2
    addi $t8, $t8, 1                # Tăng con trỏ array3
    addi $t9, $t9, 1
    j set_element_array3

# Nhập mảng và chỉ số phần tử cần lấy
nhap_xuat:
    li $v0, 4
    la $a0, ms4
    syscall

    li $v0, 5
    syscall
    move $t0, $v0

    li $v0, 4
    la $a0, ms5
    syscall

    li $v0, 5
    syscall 
    move $t1, $v0

# Kiểm tra hợp lệ của mảng và lấy giá trị qua con trỏ
    li $t2, 1
    beq $t0, $t2, mang1

    li $t2, 2
    beq $t0, $t2, mang2

    li $t2, 3
    beq $t0, $t2, mang3

# Mảng không hợp lệ
    li $v0, 4
    la $a0, ms7
    syscall
    j exit

# Truy xuất và kiểm tra địa chỉ trong array1
mang1:
    lw $t3, size1
    bge $t1, $t3, invalid_address
    la $t4, array1
    sll $t1, $t1, 2               # Nhân chỉ số với 4 byte
    add $t4, $t4, $t1
    lw $a0, 0($t4)                # Lấy giá trị thông qua con trỏ
    j print_value

# Truy xuất và kiểm tra địa chỉ trong array2
mang2:
    lw $t3, size2
    bge $t1, $t3, invalid_address
    la $t4, array2
    add $t4, $t4, $t1             # Địa chỉ array2[i] thông qua con trỏ
    lb $a0, 0($t4)
    j print_value

# Truy xuất và kiểm tra địa chỉ trong array3
mang3:
    lw $t3, size3
    bge $t1, $t3, invalid_address
    la $t4, array3
    add $t4, $t4, $t1             # Địa chỉ array3[i] thông qua con trỏ
    lb $a0, 0($t4)
    j print_value

# Xử lý địa chỉ không hợp lệ
invalid_address:
    li $v0, 4
    la $a0, ms8
    syscall
    j exit

# In giá trị của phần tử đã lấy
print_value:

    li $v0, 1
    syscall
    j exit

exit:
    li $v0, 10
    syscall
