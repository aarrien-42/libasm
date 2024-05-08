section .data
    extern ft_strlen
    ; Virtual registers:
    result dq 0 ; final result
    sign db 0 ; resulting sign
    units dq 1 ; units (1, 10, 100, 1000 (in case of decimal))
    base dw 0 ; numeric base (2 (bi), 10 (dec), 16 (hex), etc..)
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

; Input: Same as main function
; Output: 0 (All correct) or 1 (Something wrong)
check_invalid_input:
    call ft_strlen
    cmp rax, 0
    je .return_invalid ; Check if the input length is equal to 0
    push rdi
    mov rdi, rsi
    call ft_strlen
    mov word [base], ax
    pop rdi
    cmp rax, 1
    jle .return_invalid ; Check if the base length is less or equal to 1
    mov rax, 0
    jmp .return_valid ; All check correct
    .return_invalid:
    mov rax, 1
    .return_valid:
    ret


; Input:
; - rdi = input string
; - rsi = base string ("123456789"...)
; Output: rax = integer value
ft_atoi_base:
    call jump_whitespaces ; Jumps all withspaces from the start
    call check_sign ; Check sign and save it in rax
    mov byte [sign], al ; Store sign in sign register
    call check_invalid_input ; Check invalid input (null pointers or base length lower than 1)
    cmp rax, 1
    je .return_zero
    xor rbx, rbx ; Set rbx to 0
    xor rdx, rdx ; Set rdx to 0
    .main_loop:
        mov dl, [rdi]
        xor rcx, rcx
        .base_loop:
            push rsi ; Store base string start
            mov bl, [rsi]
            cmp bl, 0
            je .end_base_loop ; Leave loop if string ends
            inc rsi
            cmp dl, bl
            je .equal
            inc rcx
            jmp .base_loop
            .equal:
                mov rax, rcx
                mul qword [units]
                add qword [result], rax
        .end_base_loop:
        pop rsi ; Get base string start
        mov rax, [units]
        mul word [base]
        mov qword [units], rax
        inc rdi
    .end_main_loop:
    mov rax, [result]
    ret
    .return_zero:
    xor rax, rax
    ret

; Silence linker error
section .note.GNU-stack