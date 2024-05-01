section .text
global ft_strlen ; Declare the symbol global

; Input: rdi = pointer to the beginning of the string
; Output: rax = length of the string
ft_strlen:
    xor rax, rax ; Set rax to 0
    ret

; Silence linker error
section .note.GNU-stack