%include 'in_out.asm'

section .data
    msg1 db 'Введите B: ', 0
    msg2 db 'Наименьшее число: ', 0
    a    dd 81          ; число a
    b    dd 22          ; число b
    c    dd 72          ; число c

section .bss
    user resb 10        ; ввод пользователя (не используется, можно убрать)
    min resd 1          ; минимальное число

section .text
    global _start

_start:
    ; ---------- Найти минимум из a, b, c
    mov eax, [a]        ; берем значение a
    mov ebx, [b]        ; берем значение b
    cmp eax, ebx
    jl check_c          ; если a < b, оставить eax = a
    mov eax, ebx        ; иначе минимальное = b

check_c:
    mov ebx, [c]
    cmp eax, ebx
    jl fin              ; если текущий минимум < c, оставить eax
    mov eax, ebx        ; иначе минимальное = c

fin:
    mov [min], eax      ; сохранить минимальное значение

    ; ---------- Вывод результата
    mov eax, msg2
    call sprint
    mov eax, [min]
    call iprintLF

    call quit           ; завершение программы