section .data
    extern ft_strlen
section .text
    global ft_atoi_base ; Declare the symbol global

; Input: rdi = input string
jump_whitespaces:
    xor rax, rax ; Reset rax register to 0
    .whitespace_loop:
        mov al, [rdi]
        inc rdi
        cmp al, ' '
        je .whitespace_loop
        dec rdi
    .end_whitespace_loop:
    ret

; Input: rdi = input string
; Output: rax = '-' or '+'
check_sign:
    xor rax, rax ; Reset rax register to 0
    .sign_loop:
        mov al, [rdi]
        cmp al, '-'
        je .minus
        cmp al, '+'
        je .plus
        jmp .end_sign_loop
        .minus:
        .plus:
            mov rdx, rax ; Saves the sign value in rdx register
            inc rdi
            jmp .sign_loop ; Keep looking for sign values
    .end_sign_loop: ; No more signs
    mov rax, rdx
    ret

; Input:
; - rdi = input string
; - rsi = base string ("123456789"...)
; Output: rax = integer value
ft_atoi_base:
    call ft_strlen
    cmp rax, 0
    je .return_zero ; Check if the input length is equal to 0
    push rdi
    mov rdi, rsi
    call ft_strlen
    pop rdi
    cmp rax, 1
    jle .return_zero ; Check if the base length is less or equal to 1
    call jump_whitespaces ; Jumps all withspaces from the start
    call check_sign ; Check sign and save it in rax
    push rax ; Store sign in the stack
    xor rax, rax ; Put return register to 0
    .main_loop:
        mov r8b, [rdi]
        xor rcx, rcx ; Put counter to 0
        .base_loop:
            push rsi ; Store base string starting position
            mov r9b, [rsi]
            cmp r9b, 0 ; Check if base string ends
            je .end_base_loop
            inc rsi
            inc rcx
            cmp r8b, r9b ; Check if equal
            jne .base_equal
            pop rsi ; Get base string starting position
            jmp .base_loop
            .base_equal:
                mov rax, rcx ; WORK IN PROGRESS!
        .end_base_loop:
        inc rdi
    .end_main_loop:
    pop rax ; Get sign
    ret
    .return_zero:
    xor rax, rax
    ret

; Silence linker error
section .note.GNU-stack