%include 'in_out.asm'
SECTION .data
div: DB 'Результат: ',0

SECTION .text
GLOBAL _start
_start:
    mov ebx, 3
    mov eax, 2
    add ebx, eax    ; ebx = 5
    
    mov eax, ebx    ;
    mov ecx, 4
    mul ecx         ; eax = 5 * 4 = 20
    
    add eax, 5      ; eax = 20 + 5 = 25
    mov edi, eax    
    
    ;
    mov eax, div
    call sprint
    mov eax, edi
    call iprintLF
    call quit