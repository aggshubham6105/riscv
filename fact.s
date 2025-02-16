.data
.word 6

## Factorial of N
.text
lui x20, 0x10000
lw x10, 0, x20    # x10 = N
addi x5, x0, 1    # x5 = 1, to compare
jal x1, fact
jal x1, full_exit

fact:
    # Store
    addi sp, sp, -8
    sw x10, 0(sp)
    sw x1, 4(sp)
    
    ble x10, x5, base_cond   # if n <= 1: return 1
    
    # Recursion
    addi x10, x10, -1
    jal x1, fact       # x11 = fact(n-1)
    
    # Store
    lw x10, 0(sp)
    lw x1, 4(sp)
    
    mul x11, x11, x10  # x11 = n*fact(n-1)
    addi sp, sp, 8
    jalr x0, x1, 0     # return x11

base_cond:
    addi x11, x0, 1
    addi sp, sp, 8
    jalr x0, x1, 0 # return 1

full_exit: