.data
arr: .byte 1 2 3 4 5 6 7 8 9 10

.text
addi a0, x0, 3     # m = 5
addi a1, x0, 5     # c = 3
addi a2, x0, 10    # n = len(a)
addi a3, x0, 0x100 # Base address of array a
slli a3, a3, 20
addi a4, a3, 12    # Base address of array b

loop: bge t0, a2, exit   # i >= 10 -> break
lb t1, 0, a3
mul t2, t1, a0     # t2 = a[i]*m
add t3, t2, a1     # t3 = t2 + c
sb t3, 0, a4       # b[i] = t3
addi t0, t0, 1     # i++
addi a3, a3, 1     # a++
addi a4, a4, 1     # b++
beq x0, x0, loop
exit: