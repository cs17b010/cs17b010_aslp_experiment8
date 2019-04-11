.data
arr: .word 0, 1, 1, 1, 0, 0, 1
size:  .word 7

.text
main:
sub $sp,$sp,4
sw $ra,0($sp)
la $a0,arr
lw $a1,size
jal grouping
lw $ra,0($sp)
add $sp,$sp,4
jr $ra
grouping:
addi $t0,$t0,0
addi $t1,$t1,1

loop:
beq $a1,$0,settingarr
lw $t2,($a0)
beq $t0,$t2,loop1
beq $t1,$t2,loop2


loop1:
addi $s1,$s1,1

addi $a0,$a0,4
sub $a1,$a1,1
j loop
loop2:
addi $s2,$s2,1

addi $a0,$a0,4
sub $a1,$a1,1
j loop


settingarr:
beq $s1,$0,ones

sw $t0,($a0)
addi $a0,$a0,4
sub $s1,$s1,1
j settingarr

ones:
beq $s2,$0,exit
sw $t1,($a0)
addi $a0,$a0,4
sub $s2,$s2,1
j ones

exit:
jr $ra


