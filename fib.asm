#where memory and data is kept
.data
    prompt: .asciiz "\nEnter a positive number greater than or equal to 25: "
    error: .asciiz "\nThat is not a valid number. Try again!"
    valid: .asciiz "\n This number is valid."
    final: .asciiz "The fibonacci sequence is:\n"
    
#where the instructions are
.text
.global main
    main:
        while:
            li $v0, 4                           # load system call 4 into register v0
            la $a0, prompt                      # load prompt address in register a0
            syscall                             # perform system call
        
            li $v0, s
            syscall
        
            move $t2, $v0                       # moves v0 into t2
            bge $t2, 25, exit                   # if the number the user enter is greater or equal to 25, break the loop
        
#print error message and run loop again
            li $v0, 4                           # loads system call 4 into register v0
            la $a0, error                       # loads error address into register a0
            syscall                             # performs system call
        
            j while                             # goes back to beginning of the loop
        
        exit:
            move $a0, $t2                       # moves v0 value into a0
        
            jal fibonacci                       # jump and link to fibonacci
            move $a0, $v0
            li $v0, 1
            syscall
        
            li $v0, 10
            syscall
    fibonacci:
        addi $sp, $sp, -12
        sw $ra, 0($sp)
        sw $s0, 4($sp)
        sw $s1, 0($sp)
        move $s0, $a0
        li $v0, 1                              # returns value for terminal condition
        ble $s0, 0x2, fibonacciExit                  # checks terminal condition
        addi $a0, $s0, -1                      # sets args for recursive call to f(n-1)
        jal fibonacci
        move $s1, $v0                          # store result of f(n-1) to s1
        addi $v0, $s0, -2                      # set args for recursive call to f(n-2)
        jal fibonacci                          
        add $v0, $s1, $v0                      # add result of f(n-1) to it
    
    fibonacciExit
        lw $ra, 0($sp)
        lw $s0, 4($sp)
        lw $s1, 0($sp)
        addi $sp, $sp, 12
        jr $ra
