%include 'in_out.asm'
section .data
msg1 db 'Введите a: ',0h
msg2 db 'Введите x: ',0h
msg3 db "Результат функции: ",0h

section .bss
a resb 10
x resb 10

section .text
global _start
_start:
; ---------- Вывод сообщения 'Введите a: '
mov eax,msg1
call sprint
; ---------- Ввод 'a'
mov ecx,a
mov edx,10
call sread

; ---------- Вывод сообщения 'Введите x: '
mov eax,msg2
call sprint
; ---------- Ввод 'x'
mov ecx,x
mov edx,10
call sread

; ---------- Преобразование 'a' из символа в число
mov eax,a
call atoi ; Вызов подпрограммы перевода символа в число
mov [a],eax ; запись преобразованного числа в 'a'

; ---------- Преобразование 'x' из символа в число
mov eax,x
call atoi ; Вызов подпрограммы перевода символа в число
mov [x],eax ; запись преобразованного числа в 'x'

mov ecx,[x]
cmp ecx,[a]
jle sum
jmp fin


sum:
mov eax,[a]
mov ecx,[x]
add eax,ecx
mov [a],eax

fin:
mov eax, msg3
call sprint ; Вывод сообщения 'Результат функции: '
mov eax,[a]
call iprintLF ; Вывод 'max(A,B,C)'
call quit ; Выход
