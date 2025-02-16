.data
.byte 3,5,6,9,11,12,13,19,23,25,29,30

.text
addi x5, x0, 12   # n = 12
addi x6, x0, 19   # x = 19 (value to search for)
lui x7, 0x10000   # Base address of array

addi x10, x0, -1  # ans = -1
addi x11, x0, 0   # l = 0
addi x12, x5, -1  # r = n - 1

while: bgt x11, x12, exit
add x13, x11, x12 # m = l+r
srli x13, x13, 1   # m = m/2
# get arr[i]
add x8, x7, x13
lb x9, 0, x8  # x9 = arr[i]
beq x9, x6, found

ble x9, x6, less  # arr[i] < x
# MORE
addi x12, x13, -1
beq x0, x0, while
less:
addi x11, x13, 1
beq x0, x0, while
found:
addi x10, x8, 0
exit: