.intel_syntax noprefix
.global _start
.text
_start:

mov rax, 0
mov rdi, 0
lea rsi, [buf]
lea rdx, [len]
syscall

lea rsp, [buf]

mov rax, 1
mov rdi, 1
syscall


mov rax, 60
mov rdi, 0
syscall

.data
buf: .skip 32, 0x00
len = . - [buf]

