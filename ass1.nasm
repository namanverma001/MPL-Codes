;Write a HELLO WORLD Program in assembly level language

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
disp_msg msg2,len2

mov rax,60
mov rdi,0
syscall

section .data
msg1 db "HELLO WORLD",10
len1 equ $-msg1

msg2 db "Welcome to MPL lab",10
len2 equ $-msg2

