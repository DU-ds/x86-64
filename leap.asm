section .text
global leap_year
leap_year:
    mov RAX, RDI
    xor RDX, RDX ; overflow
    mov RBX, 4 ; testing division by 4
    idiv RBX
    cmp RDX, 0
    jne not_leapyear
    mov RAX, RDI
    mov RBX, 100
    idiv RBX
    cmp RDX, 0
    je div_hundred
    jmp true

true:
    mov RAX, 1
    ret

not_leapyear:
    mov RAX, 0
    ret

div_hundred:
    mov RAX, RDI
    xor RDX, RDX
    mov RBX, 400
    idiv RBX
    cmp RDX, 0
    je true
    jmp not_leapyear

%ifidn __OUTPUT_FORMAT__,elf64
section .note.GNU-stack noalloc noexec nowrite progbits
%endif

# https://stackoverflow.com/questions/8845191/nasm-x86-64-bit-division
# https://stackoverflow.com/questions/8021772/assembly-language-how-to-do-modulo