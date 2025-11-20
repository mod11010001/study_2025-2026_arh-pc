%include "in_out.asm"      ; Подключение внешнего файла

SECTION .data
    msg1    db "Сообщение № 1", 0
    msg2    db "Сообщение № 2", 0
    msg3    db "Сообщение № 3", 0

SECTION .text
    global _start

_start:
    jmp _label3              ; Переход сразу ко 2-й метке

_label1:
    mov eax, msg1            ; Вывод: "Сообщение № 1"
    call sprintLF
jmp _end
_label2:
    mov eax, msg2            ; Вывод: "Сообщение № 2"
    call sprintLF
jmp _label1
_label3:
    mov eax, msg3            ; Вывод: "Сообщение № 3"
    call sprintLF
jmp _label2
_end:
    call quit                ; Завершение программы
