;overlap
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



;--------code/instruction
;----to Display Source arr

disp_msg msg1,len1
mov rsi,arr
l1:mov al,[rsi]  ;fetch ele from rsi
push rsi
call display
pop rsi
inc rsi
dec byte[cnt1]
jnz l1


;-----overlapping

mov rsi,arr
mov rdi,arr
add rsi, 9
add rdi, 13
l4:mov al,[rsi]
mov [rdi],al
dec rsi
dec rdi
dec byte[cnt2]
jnz l4



;-----destination array
disp_msg msg2,len2
mov rsi,arr
l5:mov al,[rsi]
push rsi
call display
pop rsi
inc rsi
dec byte[cnt3]
jnz l5

;------exit
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
msg1 db 10,"Source array is::",10
len1 equ $-msg1

msg2 db 10,"Destination array is::",10
len2 equ $-msg2

arr db 01h, 02h, 03h, 04h, 05h, 06h, 07h, 08h, 09h, 0Ah, 0Bh, 0Ch, 0Dh, 0Eh, 0Fh
cnt1 db 0Fh
cnt2 db 05h
cnt3 db 0Fh
section .bss
disparr resb 300

