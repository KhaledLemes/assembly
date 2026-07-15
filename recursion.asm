.intel_syntax noprefix
.global _start
.text

_start:
mov rdi, 3
call sub
call byemsg
jmp exit

exit:
 mov rax, 60
 mov rdi, 0
 syscall

sub:
 cmp rdi, 0
 jle .end_sub
 
 dec rdi
 call sub

.end_sub:
 ret

byemsg:
 mov rax, 1
 mov rdi, 1
 lea rsi, [bye]
 lea rdx, [len]
 syscall
 ret

.data
bye: .ascii "You did it!!!!\n"
len = . - bye

