section .text
extern ft_strlen, malloc
global ft_strdup ; Declare the symbol global

; Input:  rdi = src string
; Output: rax = pointer to allocated string
ft_strdup:
    call ft_strlen ; Store string lenght in rax
    push rdi
    mov rdi, rax
    call malloc
    pop rdi
    mov r15, rax
    push rax
    .loop:
        mov bl, [rdi]
        mov [rax], bl
        cmp bl, 0
        je .end
        inc rdi
        inc rax
        jmp .loop
    .end:
    pop rax
    ret

; Silence linker error
section .note.GNU-stack