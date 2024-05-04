section .data
    extern ft_strlen, ft_strcpy, malloc
section .text
    global ft_strdup ; Declare the symbol global

; Input:  rdi = src string
; Output: rax = pointer to allocated string
ft_strdup:
    call ft_strlen ; Store string lenght in rax
    push rdi ; Save input string
    mov rdi, rax
    call malloc ; Call malloc using rdi as byte count
    cmp rax, 0
    je .null_pointer
    pop rdi ; Restore rdi
    mov rsi, rdi
    mov rdi, rax
    call ft_strcpy
    ret
    .null_pointer:
    xor rax, rax ; Set rax to 0
    ret

; Silence linker error
section .note.GNU-stack