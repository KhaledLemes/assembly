.intel_syntax noprefix
.global _start
.text

_start:
mov rax, [var]
mov rbx, [var]
mov eax, [var]
mov ax, [var]
mov al, 0x66
mov ah, 0x99

lea rax, [var]

mov rbx, 0

mov cl, [rax]
add rax, 1

mov rbx, [rax]

.data
var: .short 0xabcd
