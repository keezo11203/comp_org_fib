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
