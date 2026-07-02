.intel_syntax noprefix
.global _start
.text

_start:
mov rax, 0

cmp rax, 15
jle _aumentamuito
cmp rax, 15
jge _diminuitudo


mov rbx, 0
ret


_aumentamuito:
mov rax, 9999
jmp 0x00401007
ret

_diminuitudo:
mov rax, 3
jmp 0x00401007
ret
