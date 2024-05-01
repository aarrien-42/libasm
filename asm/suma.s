section .text
global suma ; Declare the symbol global

suma:
    mov eax, edi
    add eax, esi
    ret

; Silence linker error
section .note.GNU-stack