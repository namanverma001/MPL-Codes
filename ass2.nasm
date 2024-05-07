;Write an assembly language program to count positive and negative numbers from an array


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


;-------Main code----

mov rsi,arr
previous:mov ax,[rsi]
bt ax,07
jc next
inc byte[pcnt]
jmp n1

next:inc byte[ncnt]
n1:inc rsi
dec byte[cnt1]
jnz previous


disp_msg msg1,len1
mov al,byte[pcnt]
call display
disp_msg msg3,len3
disp_msg msg2,len2
mov al,byte[ncnt]
call display

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
jbe l2
add dl,07h
l2:add dl,30h
mov [rsi],dl
dec rsi
dec rcx
jnz l3

disp_msg disparr,2
ret


section .data
arr db 12h,84h,81h,82h,93h,15h,20h,66h,89h,66h
cnt1 db 0Ah
msg1 db "Positive  Number:",10
len1 equ $-msg1
 

msg2 db "Negative Number",10
len2 equ $-msg2
msg3 db " ",10
len3 equ $-msg3

section .bss
disparr resb 30
pcnt resb 10
ncnt resb 10