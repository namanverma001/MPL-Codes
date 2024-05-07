;Write an assembly language program to perform multiplication of two numbers 

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

disp_msg msg1,len1 
mov bx,000h
mov[res],bx
mov bx,0004h
mov ax,0004h

l10:add[res],bx
dec ax
jnz l10
mov ax, [res]
call display

;exit
mov rax,60
mov rdi,0
syscall

display:
mov rcx,4
mov rsi,disparr+3
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

disp_msg disparr,4

ret

section .data
msg1 db "Result is :",10
len1 equ $-msg1

section .bss
disparr resb 4
res resb 4