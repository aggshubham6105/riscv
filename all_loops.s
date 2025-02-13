addi t2, t2, 10 # t1 -> i, t2 -> 10

# While Loop (Executes statement only if condition is true)
loop1:
blt t1, t2, task1  # while (t1 < t2)
beq x0, x0, exit1
task1: # Statements
addi t1, t1, 1     # t1++;
beq x0, x0, loop1
exit1:


addi t1, x0, 0
# Do-While Loop (Executes the statement atleast once, even if condition is false)
task2: #Statements
addi t1, t1, 1     # t1++;
blt t1, t2, task2  # while (t1 < t2)
exit2:


# For Loop (Executes statement t2 times)
addi t1, x0, 0            # for( t1 = 0;
loop3:
blt t1, t2, task3         # (t1 < t2);
beq x0, x0, exit3
task3:
# STATEMENTS HERE
addi t1, t1, 1            # (t1++);
beq x0, x0, loop3
exit3: