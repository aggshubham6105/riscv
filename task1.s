# Temp variables to store 1,2,3
addi x5, x0, 1
addi x6, x0, 2
addi x7, x0, 3

addi x10, x0, 1   # x10 is input, x11 is result

jal x1, switch_func
beq x0, x0, exit

switch_func:
    beq x10, x5, CASE1
    beq x10, x6, CASE2
    beq x10, x7, CASE3
    beq x0, x0, DEFAULT

    CASE1: 
        addi x11, x0, 0xA
        jalr x0, x1, 0

    CASE2:
        addi x11, x0, 0xB
        jalr x0, x1, 0

    CASE3:
        addi x11, x0, 0xC
        jalr x0, x1, 0

    DEFAULT:
        addi x11, x0, 0xD
        jalr x0, x1, 0
        
exit: