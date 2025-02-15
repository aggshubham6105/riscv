.data
.asciiz "heyhowareYou"
.asciiz "helloIareyou"

## PROGRAM TO COUNT DIFFERENT CHARACTERS

.text
addi x5, x0, 12  # n = 12
lui x6, 0x10000  # base addr of s1
addi x7, x6, 13   # base addr of s2

addi x9, x0, 0    # x9 = ans

addi x10, x0, 0  # i = 0

loop: bge x10, x5, exit
lb x11, 0, x6
lb x12, 0, x7

addi x10, x10, 1
addi x6, x6, 1
addi x7, x7, 1

addi x13, x11, 26
addi x14, x12, 26

beq x11, x12, loop
beq x11, x14, loop
beq x12, x13, loop
addi x9, x9, 1
beq x0, x0, loop

exit: