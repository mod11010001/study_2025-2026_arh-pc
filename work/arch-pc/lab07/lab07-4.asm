; -------------------------------------------------------------
; Программа для вычисления функции f(x)
; f(x) = 3a + 1, если x < a
; f(x) = 3x + 1, если x >= a
; -------------------------------------------------------------

%include 'in_out.asm'

section .data
    msg_x db 'Введите x: ',0
    msg_a db 'Введите a: ',0
    msg_res db 'Результат f(x): ',0

section .bss
    x_val resd 1
    a_val resd 1
    res   resd 1
    buf   resb 10

section .text
    global _start

_start:
    ; ---------- Ввод x
    mov eax, msg_x
    call sprint
    mov ecx, buf
    mov edx, 10
    call sread
    mov eax, buf
    call atoi
    mov [x_val], eax

    ; ---------- Ввод a
    mov eax, msg_a
    call sprint
    mov ecx, buf
    mov edx, 10
    call sread
    mov eax, buf
    call atoi
    mov [a_val], eax

    ; ---------- Вычисление f(x)
    mov eax, [x_val]
    cmp eax, [a_val]
    jl less_than_a      ; если x < a
    ; x >= a
    mov eax, [x_val]
    imul eax, 3
    add eax, 1
    jmp finish

less_than_a:
    mov eax, [a_val]
    imul eax, 3
    add eax, 1

finish:
    mov [res], eax      ; сохранить результат

    ; ---------- Вывод результата
    mov eax, msg_res
    call sprint
    mov eax, [res]
    call iprintLF

    call quit
