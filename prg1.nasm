;Write an assembly language program to implement far procedure to concatenate two string 


global _start
_start:
global str1,str2,str1_len,str2_len,total_len
extern proc1

section  .text
%macro disp_msg 2
mov rax ,1
mov rdi,1
mov rsi ,%1
mov rdx ,%2
syscall
%endm


%macro read 2
mov rax ,0
mov rdi ,0
mov rsi,%1
mov rdx,%2
syscall
%endm

disp_msg msg1,len1
read str1 ,str1_len
;mov al , byte[str1_len]
dec al
mov byte[str1_len],al



disp_msg msg2,len2
read str2 ,str2_len
dec al
mov byte[str2_len],al


call proc1

;to exit
mov rax,60
mov rdi,0
syscall

display:
mov rsi,disparr+1
mov rcx,2
l2: mov rdx,0
mov rbx,10h
div rbx
cmp dl,09h
jbe l1
add dl,07h
l1: add dl,30h
mov [rsi],dl
dec rsi
dec rcx
jnz l2
 
disp_msg disparr,2
 
ret


section .data
msg1 db "Enter a string1:",10
len1 equ $-msg1 
msg2 db "Enter a string2:",10
len2 equ $-msg2 

section .bss
str1 resb 50
disparr resb 20
str2 resb 50
str1_len resb 50
str2_len resb 50
total_len resb 30

