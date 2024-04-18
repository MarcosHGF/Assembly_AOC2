.data

mensagem: .asciiz "\n"

.text
.globl main

main:  	
    lw $s1, 0($sp)
    li $s1, 2
    
    lw $s2, 8($sp)
    li $s2, 3
    
    lw $s3, 16($sp)
    move $s3, $zero
    
    lw $s4, 32($sp)
    move $s4, $zero
    
    jal sum_int
    
    #Print
    li $v0, 1         
    move $a0, $s3      
    syscall     
    
    li $v0, 4
    la $a0, mensagem
    syscall       
    
    jal sub_int
    
    #Print
    li $v0, 1           
    move $a0, $s4      
    syscall     
    
    li $v0, 4
    la $a0, mensagem
    syscall        
    
    li $v0, 10      
    syscall             

sum_int:	
    add $s3, $s1, $s2 
    jr $ra
    
sub_int:
    sub $s4, $s1, $s2
    jr $ra
