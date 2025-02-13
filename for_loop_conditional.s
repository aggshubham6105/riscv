.data
arr: .byte 10 20 -10 -5 45 50 17 -36 9 50

.text

addi x28, x0, 0x100
slli x28, x28, 20 # Base address of array

# x12 -> Sum of all elements
# x13 -> Sum of elements greater than 5
# x14 -> Sum of positive elements less than 40
# x15 -> Sum of negative elements
# x16 -> Sum of all elements with unsigned value greater than equal 35

addi x29, x0, 5
addi x30, x0, 40
addi x31, x0, 35

addi x6, x0, 10 # i = x5, 10 = x6

loop:
bge x5, x6, exit # exit loop if i >= 10
addi x5, x5, 1

lb x7, 0, x28 # x7 = arr[i]
addi x28, x28, 1

add x12, x12, x7

ble x7, x29, skip1 #skip if arr[i] <= 5
add x13, x13, x7
skip1:

ble x7, x0, skip2  #skip if arr[i] <= 0
bge x7, x30 skip2  #skip if arr[i] >= 40
add x14, x14, x7
skip2:

bge x7, x0, skip3  #skip if arr[i] >= 0
add x15, x15, x7
skip3:

bltu x7, x31, skip4
add x16, x16, x7
skip4:

beq x0, x0, loop
exit: