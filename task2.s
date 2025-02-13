.data
arr: .byte 10 20 -10 -5 45 50 17 -36 9 50

.text
# x11 -> required sum
# input = x10
# 1 -> Sum of all elements
# 2 -> Sum of elements greater than 5
# 3 -> Sum of positive elements less than 40
# 4 -> Sum of negative elements
# 5 -> Sum of all elements with unsigned value greater than equal 35
addi x11, x0, 0
addi x10, x0, 2
jal x1, get_sum
beq x0, x0, exit

get_sum:
    addi x28, x0, 0x100
    slli x28, x28, 20 # Base address of array

    # To store 5, 40 and 35
    addi x29, x0, 5
    addi x30, x0, 40
    addi x31, x0, 35

    addi x5, x0, 0  # x5 (i) = 0
    addi x6, x0, 10 # x6 = 10
    
    #input check
    addi x13, x0, 1
    beq x10, x13, sum_1
    addi x13, x0, 2
    beq x10, x13, sum_2
    addi x13, x0, 3
    beq x10, x13, sum_3
    addi x13, x0, 4
    beq x10, x13, sum_4
    addi x13, x0, 5
    beq x10, x13, sum_5
    
    return:
        jalr x0, x1, 0
    
    sum_1:
        bge x5, x6, return # exit loop if i >= 10
        addi x5, x5, 1

        lb x7, 0, x28 # x7 = arr[i]
        addi x28, x28, 1

        add x11, x11, x7 # x11 += arr[i]
        beq x0, x0, sum_1
    
    sum_2:
        bge x5, x6, return # exit loop if i >= 10
        addi x5, x5, 1

        lb x7, 0, x28 # x7 = arr[i]
        addi x28, x28, 1

        ble x7, x0, sum_2 #skip if arr[i] <= 0
        add x11, x11, x7 # x11 += arr[i]
        beq x0, x0, sum_2

    sum_3:
        bge x5, x6, return # exit loop if i >= 10
        addi x5, x5, 1

        lb x7, 0, x28 # x7 = arr[i]
        addi x28, x28, 1

        bge x7, x30 sum_3  #skip if arr[i] >= 40
        add x11, x11, x7 # x11 += arr[i]
        beq x0, x0, sum_3

    sum_4:
        bge x5, x6, return # exit loop if i >= 10
        addi x5, x5, 1

        lb x7, 0, x28 # x7 = arr[i]
        addi x28, x28, 1

        bge x7, x0, sum_4  #skip if arr[i] >= 0
        add x11, x11, x7 # x11 += arr[i]
        beq x0, x0, sum_4

    sum_5:
        bge x5, x6, return # exit loop if i >= 10
        addi x5, x5, 1

        lb x7, 0, x28 # x7 = arr[i]
        addi x28, x28, 1

        bltu x7, x31, sum_5
        add x11, x11, x7 # x11 += arr[i]
        beq x0, x0, sum_5

exit: