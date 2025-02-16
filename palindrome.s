.data
.asciiz "racecar"

.text
lui x15, 0x10000

# Store address of last letter of string in x16
addi x16, x15, 0
loop:
lb x17, 1, x16
beq x17, x0, exit
addi x16, x16, 1
beq x0, x0, loop
exit:

# Check Palindrome
addi x20, x0, 1     # Initalize answer to yes
loop2:
bge x15, x16, palin_exit
lb x21, 0, x15
lb x22, 0, x16
bne x21, x22, not_palin
addi x15, x15, 1
addi x16, x16, -1
beq x0, x0, loop2

not_palin:
addi x20, x0, 0

palin_exit:
## Store answer x20 in memory 0x10000100.
lui x15, 0x10000
addi x15, x15, 0x100

# YES
beq x20, x0, NO
addi x30, x0, 'y'
slli x30, x30, 8
addi x30, x30, 'e'
slli x30, x30, 8
addi x30, x30, 's'
beq x0, x0, final

# NO
NO:
addi x30, x0, 'n'
slli x30, x30, 8
addi x30, x30, 'o'

final:
sw x30, 0, x15