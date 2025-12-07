%include 'in_out.asm'

SECTION .data
div: DB 'Результат: ',0

SECTION .text
global _start   ; Директива, которая решает проблему предупреждения компоновщика (ld warning)

_start:
    ; ---- Вычисление выражения (3+2)*4+5
    mov ebx, 3
    mov eax, 2
    add ebx, eax    ; EBX = 5 (Сумма 3 + 2)
    
    ; ИСПРАВЛЕНИЕ ДЛЯ ЗАДАНИЯ №2: 
    ; Исходная ошибка заключалась в том, что MUL использует EAX. 
    ; Мы переносим сумму (5) из EBX в EAX.
    mov eax, ebx    
    
    mov ecx, 4
    mul ecx         ; EAX = 5 * 4 = 20
    
    add eax, 5      ; EAX = 20 + 5 = 25
    mov edi, eax    
    
    ; ---- Вывод результата
    mov eax, div
    call sprint
    mov eax, edi
    call iprintLF
    call quit