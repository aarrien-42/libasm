section .text
global ft_strlen ; Declare the symbol global

; Input: rdi = pointer to the beginning of the string
; Output: rax = length of the string
ft_strlen:
    cmp rdi, 0
    je .null_pointer ; Cheks if input is NULL
    mov rcx, rdi
    .loop:
        mov al, [rcx] ; Stores the value pointed by rcx in al (8 bit register)
        cmp al, 0
        je .end ; Cheks the end of the string
        inc rcx
        jmp .loop ; Continues looping
    .end:
    sub rcx, rdi ; Calculates the distance betwen both directions
    mov rax, rcx ; Sets return value
    ret
    .null_pointer:
    xor rax, rax ; Sets return value to 0
    ret

; Silence linker error
section .note.GNU-stack