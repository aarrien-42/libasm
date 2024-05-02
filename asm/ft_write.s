section .text
global ft_write ; Declare the symbol global

; Input: 
; - rdi = file descriptor
; Output: rax = bytes written
ft_write:
    xor rax, rax ; Set rax to 0
    ret

; Silence linker error
section .note.GNU-stack