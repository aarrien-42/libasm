section .text
    global ft_strcpy ; Declare the symbol global

; Input: 
; - rdi = dst string
; - rsi = src string
; Output: rax = pointer to dst
ft_strcpy:
    cmp rsi, 0
    je .null_pointer ; Cheks if input is NULL
    push rdi
    push rsi
    .loop:
        mov al, [rsi] ; Stores the value pointed by rsi in al (8 bit register)
        mov [rdi], al
        cmp al, 0
        je .end ; Cheks the end of the string
        inc rsi
        inc rdi
        jmp .loop
    .end:
    pop rsi
    pop rdi
    mov rax, rdi
    ret
    .null_pointer:
    xor rax, rax ; Sets return value to 0
    ret

; Silence linker error
section .note.GNU-stack