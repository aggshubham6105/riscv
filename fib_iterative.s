lui x20, 0x10000
addi x10, x0, 10   # first 10 fibonacci numbers

addi x11, x10, 0
slli x11, x11, 2 # Offset in x11
add x15, x20, x11 # Last_Addr in x15

addi x5, x0, 1
sw x5, 0, x20
addi x20, x20, 4
sw x5, 0, x20
addi x20, x20, 4

loop: bge x20, x15, exit
lw x16, -4, x20
lw x5, -8, x20
add x16, x16, x5
sw x16, 0, x20
addi x20, x20, 4
beq x0, x0, loop

exit: