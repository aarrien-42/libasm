section .text
global ft_read ; Declare the symbol global

; Input: 
; - rdi = file descriptor
; - rsi = buffer
; - rdx = byte count
; Output: rax = bytes readed
ft_read:
    mov rax, 0 ; Set syscall to sys_read (rax = 0)
    syscall
    ret

; Silence linker error
section .note.GNU-stack