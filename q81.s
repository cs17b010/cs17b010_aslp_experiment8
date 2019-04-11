.data
array: .word 1, 2, 3, 4, 3, 3, 3
size:  .word 7
count: .word 0
element: .word 3

.text
main:
la $a0,array
lw $a1,size
lw $a2,element
sub $sp,$sp,4
sw $ra,0($sp)
jal sea
sw $v0,count
lw $ra,0($sp)
add $sp,$sp,4
jr $ra

sea:
addi $v1,$v1,0
addi $t0,$t0,0
loop:
slt $t1,$t0,$a1
beq $t1,$0,exit
lw $s1,($a0)
addi $a0,$a0,4
bne $s1,$a2,jloop
addi $v1,$v1,1
jloop:
addi $t0,$t0,1
j loop
exit: 
jr $ra
