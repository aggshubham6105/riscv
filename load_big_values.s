# Base Address
auipc t0, 0x10000 

# Load 0xDEADBEEF into t0
lui t1, 0xDEADC
addi t1, t1, -0x111

sw t1, 0, t0