.data
array: .word 34, 7, 23, 32, 15, 88, 26, 12, 29, 5   # vetor com 10 posições
mens_min: .asciiz "min="
mens_max: .asciiz "max="
mens_n: .asciiz "\n"

.text
.globl main
main:
    la $a0, array          # Carrega o endereço base do vetor em $a0
    li $t0, 0                  # Inicializa o índice i = 0
    lw $t1, 0($a0)       # Inicializa $t1 com o primeiro elemento do vetor (min = array[0])

    lw $t2, 0($a0)       # Inicializa $t2 com o primeiro elemento do vetor (max = array[0])
    li $t3, 10               # Tamanho do vetor

#code

loop:
    lw $t4, 0($a0)
    bgt $t4, $t2, maior
    blt $t4, $t1, menor
    
    #i++ e checa se i != 10
    addi $t0, $t0, 1
    addi $a0, $a0, 4
    bne $t0, $t3, loop


    #printa
    li $v0, 4
    la $a0, mens_max
    syscall
    
    li $v0, 1
    move $a0, $t2
    syscall

    li $v0, 4
    la $a0, mens_n
    syscall
    
    
    li $v0, 4
    la $a0, mens_min
    syscall
    
    li $v0, 1
    move $a0, $t1
    syscall

# Encerra o programa
    li $v0, 10
    syscall
    
#funções
maior:
    move $t2, $t4
    j loop

menor:
    move $t1, $t4
    j loop
