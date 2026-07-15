.intel_syntax noprefix
.global _start
.text

read:
mov rax, 0
mov rdi, 0
syscall
ret

print:
mov rax, 1
mov rdi, 1
syscall
ret

sum:

sub:


_start:
lea rsi, [firstmsg]
lea rdx, [fmsglen]
call print

lea rsi, [opt]
mov rdx, 1
call read

mov al, [opt]
sub al, 0x30
cmp al, 0
 jl _start
 je goodbye
cmp al, 1
 je sum
cmp al, 2
 je sub
 jg _start
 

goodbye:
lea rsi, [goodbyemsg]
lea rdx, [byelen]
call print

mov rax, 60
mov rdi, 0
syscall


.data
firstmsg:
 .ascii "Calculator! Choose your destiny\n0-Exit\n1-Sum\n2-Subtraction\n"
 fmsglen = . - firstmsg

goodbyemsg:
 .ascii "***************\nThank you very much for playing calculator!"
 byelen = . - goodbyemsg

opt:
 .byte

n1:
 .word
n2:
 .word
