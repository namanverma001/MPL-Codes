;Write an assembly language program to accept a string and display its length 

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

;procedure
%macro read 2
mov rax,0
mov rdi,0
mov rsi,%1
mov rdx,%2
syscall
%endm


disp_msg msg1,len1
read str1,len2
dec al
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

cntl db 05h
msg1 db 10, "Enter a string  :"
len1 equ $-msg1



section .bss
disparr resb 30
str1 resb 10
len2 resb 10
