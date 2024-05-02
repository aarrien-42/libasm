section .text
global ft_write ; Declare the symbol global

; Input: 
; - rdi = file descriptor
; - rsi = constant buffer
; - rdx = byte count
; Output: rax = bytes written
ft_write:
    mov rax, 1 ; Set syscall to sys_write (rax = 1)
    syscall
    ret

; Silence linker error
section .note.GNU-stack