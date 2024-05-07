;Write an assembly language program to find factorial of a given number

global _start
_start:

section .text

%macro disp_msg 2
mov rax,1
mov rdi,1
mov rsi,%1
mov rdx,%2
syscall
%endm

;factorial procedure
disp_msg msg1,len1

mov rax,01h
mov rbx,04h
l1:mul rbx
dec rbx
dec byte[cnt1]
jnz l1
call display


;exit
mov rax,60
mov rdi,0
syscall

;display
display:
mov rcx,2
mov rsi,disparr+1
l3:mov rdx,0
mov rbx,10h
div rbx
cmp dl,09h
jbe l2
add dl,07h
l2:add dl,30h
mov[rsi],dl
dec rsi
dec rcx
jnz l3

disp_msg disparr,2

ret

section .data


msg1 db 10, "Factorial is :"
len1 equ $-msg1

arr1 db 04h,03h,02h,01h
cnt1 db 04h


section .bss
disparr resb 30