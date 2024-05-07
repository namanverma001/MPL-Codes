;Write an assembly language program to sort 10 unsigned integers using Bubble Sort 

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

disp_msg msg1, len1
p2: mov byte[cnt2],4
mov rsi,arr
mov rdi,arr
inc rdi
p1: mov cl,[rsi]
mov dl,[rdi]
cmp cl, dl
jbe b1
call swap
b1:mov[rsi],cl
mov[rdi],dl
inc rsi
inc rdi
dec byte[cnt2]
jnz p1
dec byte[cnt1]
jnz p2

mov rsi,arr
p3:mov al,[rsi]
push rsi
call display
pop rsi
inc rsi
dec byte[cnt3]
jnz p3

mov rax,60
mov rdi,0
syscall

display:
mov rcx,02h
mov rsi,disparr+1
l3:mov rdx,0h
mov rbx,10h
div rbx
cmp dl,09h
jbe l4
add dl,07h
l4:add dl,30h
mov [rsi],dl
dec rsi
dec rcx
jnz l3

disp_msg disparr,2
ret

swap:
mov al,dl
mov dl,cl
mov cl,al
ret

section .data
arr db 05h,01h,02h,04h,03h
cnt1 db 05h
cnt2 db 04h
cnt3 db 05h
msg1 db "Sorted array:: "
len1 equ $-msg1

section .bss
disparr resb 300
