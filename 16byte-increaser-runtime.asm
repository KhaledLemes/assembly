.intel_syntax noprefix
.global _start
.text

_start:
lea rsp, [var] # Stack pointer
mov r9, rsp # Wil hold the reference to the current long
mov r8, 0 # Value to compare later
mov rax, 0x1111111111111111 ;# Value to increase

jmp 0x0040102e # Jumps to comparison
 mov [r9], rax
 inc rax
 add r9, 8
 inc r8


cmp r8, 16
jl 0x00401021

.data
var: .skip 128, 0xff # 16 long ints with the same value



