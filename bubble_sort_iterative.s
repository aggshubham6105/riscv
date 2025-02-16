.data
.byte 20,10,30,4,5,19,16,50,10,3

.text
addi x5, x0, 10   # n = 10
lui x10, 0x10000  # Base address of array

addi x6, x5, -1    # i = n-1

while1: ble x6, x0, exit1
    addi x7, x0, 0   # j = 0
    lui x10, 0x10000 # *j (arr)
    while2: bge x7, x6, exit2
        addi x7, x7, 1  # j += 1
        addi x10, x10, 1 # *j++ (arr)
        lb x8, -1, x10 # x8 = a[j-1]
        lb x9, 0, x10 # x9 = a[j]
        ble x8, x9, while2
        # SWAP
        sb x9, -1, x10
        sb x8, 0, x10
        beq x0, x0, while2
    exit2:
    addi x6, x6, -1  # i -= 1
    beq x0, x0, while1
exit1: