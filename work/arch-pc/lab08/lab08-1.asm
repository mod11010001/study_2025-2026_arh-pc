;-----------------------------------------------------------------
; Программа вывода значений регистра ECX
;-----------------------------------------------------------------

%include "in_out.asm"

SECTION .data
    msg1 db "Введите N: ", 0h

SECTION .bss
    N   resb 10

SECTION .text
    global _start

_start:
    ; ----- Вывод сообщения "Введите N:"
    mov eax, msg1
    call sprint

    ; ----- Ввод N
    mov ecx, N
    mov edx, 10
    call sread

    ; ----- Преобразование N из строки в число
    mov eax, N
    call atoi
    mov [N], eax

    ; ----- Организация цикла
    mov ecx, [N]        ; Счётчик цикла (ECX = N)

label:
    push ecx
    sub ecx, 1
    mov [N], ecx
    mov eax, [N]
    call iprintLF       ; Вывод значения ECX
    pop ecx

    loop label          ; ECX = ECX - 1, если не 0 → переход на label

    call quit
