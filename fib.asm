#where memory and data is kept
.data
    prompt: .asciiz "\nEnter a positive number greater than or equal to 25: "
    error: .asciiz "\nThat is not a valid number. Try again!"
    valid: .asciiz "\n This number is valid."
    final: .asciiz "The fibonacci sequence is:\n"
