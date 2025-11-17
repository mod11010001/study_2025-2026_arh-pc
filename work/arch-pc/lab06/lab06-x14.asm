;-----------------------------------
; Программа вычисления f(x) = (x/2 + 8)*3
;-----------------------------------

%include 'in_out.asm'

SECTION .data
    msg: DB 'Введите значение x: ',0
    res: DB 'Результат: ',0

SECTION .bss
    x_input: RESB 80

SECTION .text
    GLOBAL _start

_start:
    ; 1. Выводим сообщение для ввода x
    mov eax, msg
    call sprintLF

    ; 2. Чтение введённого значения
    mov ecx, x_input
    mov edx, 80
    call sread

    ; 3. Преобразуем ASCII в число
    mov eax, x_input
    call atoi   ; результат в eax

    ; 4. Вычисляем f(x) = (x / 2 + 8) * 3
    mov ebx, 2
    xor edx, edx
    div ebx       ; eax = x / 2, остаток в edx (не нужен)
    add eax, 8    ; eax = x/2 + 8
    mov ebx, 3
    mul ebx       ; eax = (x/2 + 8) * 3

    ; 5. Выводим результат
    mov edi, eax  ; сохраняем результат
    mov eax, res
    call sprint
    mov eax, edi
    call iprintLF

    ; 6. Завершение программы
    call quit
