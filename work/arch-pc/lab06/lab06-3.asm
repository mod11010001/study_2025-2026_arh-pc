;--------------------------------
; Программа вычисления выражения f(x) = (5*2+3)/3
;--------------------------------

%include 'in_out.asm'

SECTION .data
    ; Подключение внешнего файла
    div: DB 'Результат: ',0
    rem: DB 'Остаток от деления: ',0

SECTION .text
GLOBAL _start

_start:
    ;---- Вычисление выражения
    mov eax, 4      ; EAX = 4
    mov ebx, 6      ; EBX = 6
    mul ebx         ; EAX = EAX * EBX
    add eax, 2      ; EAX = EAX + 2

    xor edx, edx    ; обнуляем EDX для корректной работы div
    mov ebx, 5      ; EBX = 5
    div ebx         ; EAX = EAX / EBX, EDX = остаток

    mov edi, eax    ; записываем результат в EDI

    ;---- Вывод результата на экран
    mov eax, div    ; адрес сообщения "Результат: "
    call sprint

    mov eax, edi    ; результат вычисления
    call iprintLF

    mov eax, rem    ; адрес сообщения "Остаток от деления: "
    call sprint

    mov eax, edx    ; остаток от деления
    call iprintLF

    call quit       ; завершение программы
