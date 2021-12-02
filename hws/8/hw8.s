# Exercise 6.8
    beq s4,s5, L1 # skip if s4 == 5
    addi s3, s3, 1, 0 # s3 = 1

# Exercise 6.9a
#s0 = g, s1 = h
    blt s0, s1, L1 #  skip if g > h
    addi s0,s0,1 # g = g + 1
    j L2
L1: sub s1, s1, 1 # h = h - 1
L2:

# Exercise 6.9b
#s0 = g, s1 = h
    bge s0, s1, L1 #  skip if g < h
    addi s0, zero, 0 # g = 0
    j L2
L1: addi s1, zero, 0 # h = 0
L2:

# Exercise 6.13a 
addi s7, zero, 29 # s7 = 29
# Exercise 6.13b 
addi s7, zero, -214
# Exercise 6.13c 
addi s7, zero, -2999
# Exercise 6.13d 
lui s6, 0xABCDE # s6 = 0xABCDE000
addi s7, s6, zero  # s7 = 0xABCDE000
# Exercise 6.13e 
lui s6, 0xEDCBA # s6 = 0xEDCBA000
addi s7, s6, 0x123  # s7 = 0xEDCBA123
# Exercise 6.13f 
lui s6, 0xEEEEEFAB # s6 = 0xEEEEEFAB
addi s7, s6, zero  # s7 = 0xABCDE000


