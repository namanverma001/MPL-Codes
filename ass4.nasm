; Write an assembly language program to search an item in given data 

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
read no1,3
mov al,byte[no1]
sub al,30h
mov rsi,arr
l11:mov bl,[rsi]
cmp al,bl
je l10
inc rsi
dec byte[cntl]
jnz l11
jmp l12
l10:disp_msg msg2,len2
jmp exit
l12:disp_msg msg3,len3



exit:mov rax,60
mov rdi,0
syscall



section .data
arr db 01h,02h,03h,04h,05h
cntl db 05h
msg1 db 10, "Enter a number you want to search :"
len1 equ $-msg1
msg2 db 10, "The number is found :"
len2 equ $-msg2
msg3 db 10, "The number is not found:"
len3 equ $-msg3

section .bss
disparr resb 30
no1 resb 10

