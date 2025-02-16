.data
.word 7

.text
lui x20, 0x10000
lw x10, 0, x20

addi x11, x0, 1

loop: ble x10, x0, exit
mul x11, x11, x10
addi x10, x10, -1
beq x0, x0, loop

exit: