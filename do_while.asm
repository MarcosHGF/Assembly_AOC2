.data
quantos: .asciiz "Quantos numeros?\n"
informe: .asciiz "Informe o num.:\n"
linha: .asciiz "\n"
    
.text
.globl main
    
main:

    li $v0, 4
    la $a0, quantos
    syscall
    
    #scan
    li $v0, 5
    syscall
    move $t0, $v0
    
    #i=0
    li $t1, 0
    
loop:
    
    li $v0, 4           
    la $a0, informe
    syscall
    
    #scan
    li $v0, 5
    syscall
    move $a0, $v0
    
    jal printa
    
    li $v0, 4
    la $a0, linha
    syscall
    
    #i++
    addi $t1, $t1, 1
    
    #condição
    bne $t1, $t0, loop
    
    li $v0, 10
    syscall
    

printa:

    li $v0, 1
    syscall
    jr $ra        