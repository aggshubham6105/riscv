.data
arr1: .byte 2, 5, 10, 18, 20, 34, 35, 40
arr2: .byte 5, 8, 11, 22, 29, 30, 31, 32

.text
lui x10, 0x10000
addi x11, x10, 8
addi x12, x11, 0
addi x13, x12, 8
addi x15, x13, 0

loop:
bge x10, x11, addx6
bge x12, x13, addx5
lb x5, 0, x10
lb x6, 0, x12
blt x5, x6, addx5
addx6:
    bge x12, x13, exit
    lb x6, 0, x12
    sb x6, 0, x15
    addi x15, x15, 1
    addi x12, x12, 1
    beq x0, x0, loop
addx5:
    bge x10, x11, exit
    lb x5, 0, x10
    sb x5, 0, x15
    addi x15, x15, 1
    addi x10, x10, 1
    beq x0, x0, loop

exit: