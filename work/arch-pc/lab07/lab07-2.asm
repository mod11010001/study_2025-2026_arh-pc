%include 'in_out.asm'

section .data
    msg1 db 'Введите B: ', 0
    msg2 db 'Наибольшее число: ', 0
    A    dd 20          ; число A
    C    dd 50          ; число C

section .bss
    B   resb 10         ; ввод пользователя
    max resd 1          ; максимальное число

section .text
    global _start

_start:
    ; ---------- Ввод B
    mov eax, msg1
    call sprint          ; вывести сообщение
    mov ecx, B
    mov edx, 10
    call sread           ; считать строку
    mov eax, B
    call atoi            ; преобразовать в число
    mov [B], eax         ; сохранить B как число

    ; ---------- Найти максимум из A и C
    mov eax, [A]
    mov ebx, [C]
    cmp eax, ebx
    jg check_B           ; если A > C, перейти к сравнению с B
    mov eax, ebx         ; иначе максимальное = C

check_B:
    ; ---------- Сравнение с B
    cmp eax, [B]
    jg fin               ; если max(A,C) > B, конец
    mov eax, [B]         ; иначе max = B

fin:
    mov [max], eax       ; сохранить максимальное значение

    ; ---------- Вывод результата
    mov eax, msg2
    call sprint
    mov eax, [max]
    call iprintLF

    call quit            ; завершение программы
