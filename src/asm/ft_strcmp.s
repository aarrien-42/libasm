section .text
    global ft_strcmp ; Declare the symbol global

; Input: 
; - rdi = s1 string
; - rsi = s2 string
; Output: rax = comparation result
ft_strcmp:
    xor rax, rax
    cmp rdi, 0
    je .end
    cmp rsi, 0
    je .end
    .loop:
        mov al, [rdi]
        mov bl, [rsi]
        cmp bl, 0
        je .end
        sub al, bl
        cbw ; ax sign-extend of al
        cwde ; eax sign-extend of ax
        cmp al, 0
        jne .end
        inc rdi
        inc rsi
        jmp .loop
    .end:
    ret

; Silence linker error
section .note.GNU-stack