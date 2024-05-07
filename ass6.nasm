;Write an assembly language program to find average of numbers declared in data segment 

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

mov rsi,arr1
l4: mov al,[rsi]
push rsi
call display
pop rsi
inc rsi
dec byte[cnt1]
jnz l4

;average procedure
disp_msg msg2,len2

mov bl,0h
mov rsi,arr1
l1:mov al,[rsi]
add bl,al
inc rsi
dec byte[cnt2]
jnz l1
mov rdx,0h
mov al,bl
mov rbx,05h
div rbx
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
msg1 db "Source Array :",10
len1 equ $-msg1

msg2 db 10, "Average is :"
len2 equ $-msg2

arr1 db 02h,04h,06h,08h,0Ah

cnt1 db 05h
cnt2 db 05h

section .bss
disparr resb 30