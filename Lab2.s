.section .text
.globl ham_dist              

ham_dist:
    xor %edx, %edx           # hamming counter = 0

loop_start:
    movb (%rdi), %al         # store first byte of both strings
    movb (%rsi), %bl

    test %al, %al            # check if either char is null before comparison
    je done
    test %bl, %bl
    je done

    mov $8, %ecx             

loop_compare:
    shl $1, %al              # shift left
    setc %r8b                # r8b = bit from first byte

    shl $1, %bl              # shift left
    setc %r9b                # r9b = bit from second byte

    cmp %r8b, %r9b           # compare 
    je same              # if equal, skip

    inc %edx                 # increment counter if differ

same:
    dec %ecx                 # next bit
    jnz loop_compare    # repeat 8 times

    inc %rdi                 # next character
    inc %rsi
    jmp loop_start          # repeat for next byte

done:
    mov %edx, %eax           # stores counter in eax to be returned to C file
    ret                      # return control to C file

.section .note.GNU-stack,"",@progbits
