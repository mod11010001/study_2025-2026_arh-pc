;-------------------------------
; Программа вычисления варианта
;-------------------------------

%include 'in_out.asm'

SECTION .data
    msg: DB 'Введите № студенческого билета: ',0
    rem: DB 'Ваш вариант: ',0

SECTION .bss
    x:  RESB 80

SECTION .text
    GLOBAL _start

_start:
    ; вывод сообщения для ввода номера
    mov eax, msg
    call sprintLF

    ; чтение введённой строки
    mov ecx, x
    mov edx, 80
    call sread

    ; преобразование ASCII → число
    mov eax, x
    call atoi   ; результат в eax

    xor edx, edx        ; очистка edx перед делением
    mov ebx, 20         ; делитель
    div ebx             ; eax = eax / 20, edx = остаток

    inc edx             ; вариант = (Sn mod 20) + 1

    ; вывод результата
    mov eax, rem
    call sprint

    mov eax, edx
    call iprintLF

    call quit
