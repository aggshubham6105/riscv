.data
.asciiz "dlroW olleH"

.text
lui x13, 0x10000
addi x5, x0, 'a'
addi x6, x0, 'z'
beq x0, x0, ALLCAPS

ALLCAPS:
lb x10, 0, x13
beq x10, x0, EXIT
addi x13, x13, 1
blt x10, x5, ALLCAPS
bgt x10, x6, ALLCAPS
addi x10, x10, -32
sb x10, -1, x13
beq x0, x0, ALLCAPS

EXIT: