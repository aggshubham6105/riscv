## f(n) = f(n-1) + f(n-2)

.data
.byte 5

.text
lui x20, 0x10000
lb x10, 0, x20    #x10 = n

#Initalizations
addi x5, x0, 2    #x5 = 2

# x11 = return values
# x12 = final answer
jal x1, fib
jal x0, full_exit

fib:
    # Store n and return location for this
    addi sp,sp,-8
    sw x1,4(sp)
    sw x10,0(sp)
    
    # if n > 2: recursion
    bgt x10, x5, recur
    
    # else return 1
    addi x11,x0,1
    addi sp,sp,8
    jalr x0, x1, 0
    
recur:
    addi x10, x10, -1
    jal x1, fib
    addi sp,sp,8
    addi x13, x11, 0  # x13 = f(n-1)
    addi x10, x10, -1
    jal x1, fib
    addi sp,sp,8
    add x13, x13, x11  # x13 += f(n-2)
    jalr x0, x1, 0

full_exit: