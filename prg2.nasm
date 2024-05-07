global _main
_main:
global proc1,total_len2
extern str1,str2,str1_len,str2_len, total_len

proc1:
%macro disp_msg1 2
mov rax ,1
mov rdi,1
mov rsi ,%1
mov rdx ,%2
syscall
%endm

mov al,byte[str1_len]
add al,byte[str2_len]
mov byte[total_len],al


mov rsi,str1
x: inc rsi
dec byte[str1_len]
jnz x

mov rdi,str2
x2: mov al,[rdi]
mov [rsi],al
inc rsi
inc rdi
dec byte[str2_len]
jnz x2



disp_msg1 str1, [total_len]


ret

 


