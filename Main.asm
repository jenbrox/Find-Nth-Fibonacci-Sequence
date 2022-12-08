.text

.globl main
main:
li $a0, 10              #n=10
jal If

If:
                        #if n > 1 go to Fibonacci method
li $a1, 0               #variable a / n-2 / F(0)
li $a2, 1               #variable b / n-1 / F(1)
li $a3, 0               #variable c
li $t0, 2               #counter for loop
beq $a0, 0, Zero        #if n is 0, n will return
beq $a0, 1, One         #if n is 1, n will return
                        #or just jal Fibonacci
bgt $a0, 1, Fibonacci   #if n > 1, go to Fibonacci loop
#jr $ra

Fibonacci:
bgt $t0, $a0, Exit      #if counter > N, go to Exit #or do I need an end loop?
add $a3, $a2,$a1        #c = a + b
move $a1, $a2           #a = b
move $a2, $a3           #b = c
move $v0, $a2           #move b to $v0
add $t0, $t0, 1         #increment loop counter
j Fibonacci

Zero:
move $v0, $a0           #if n is 0, n will return
jr $ra

One:
move $v0, $a0           #if n is 1, n will return
jr $ra

                        #if n = 10, $v1 should contain 55
Exit:	
move $v1, $v0
li $v0, 10
syscall
