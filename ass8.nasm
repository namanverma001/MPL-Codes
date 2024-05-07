;Write an assembly language program to perform overlap and non overlap block transfer


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

;display source array
disp_msg msg1,len1

mov rsi,sarr
l1: mov al,[rsi]
push rsi
call display
pop rsi
inc rsi
dec byte[cnt1]
jnz l1

;non overlap transfer
mov rsi,sarr
mov rdi,darr
l4:mov al,[rsi]
mov[rdi],al
inc rsi
inc rdi
dec byte[cnt2]
jnz l4




;display destination array

disp_msg msg2,len2
mov rsi,darr
l5: mov al,[rsi]
push rsi
call display
pop rsi
inc rsi
dec byte[cnt3]
jnz l5


;exit
mov rax,60
mov rdi,0
syscall

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

sarr db 10H,20H,30H,40H,50H
darr db 00H,00H,00H,00H,00H 

msg1 db "Source Array :",10
len1 equ $-msg1

msg2 db 10, "Destination array: ",10
len2 equ $-msg2

cnt1 db 05H
cnt2 db 05H
cnt3 db 05h

section .bss
disparr resb 30