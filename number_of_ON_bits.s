addi t0, x0, 0xAA   # t0 -> original word

add t1, x0, t0      # t1 -> word copy

loop: beq t1, x0, exit
andi t2, t1, 1      # t2 -> last bit of t1
srli t1, t1, 1      # t1 -> t1 right shift 1 (t1 = t1/2)
beq t2, x0, loop
addi t3, t3, 1      # Add 1 to answer -> t3
beq x0, x0, loop
exit: