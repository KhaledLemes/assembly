.intel_syntax noprefix
.global _start
.text

_start:
mov r8, 0
lea rsp, [var]
lea rcx, [var]

mov al, [rcx]

inc rcx
inc r8
cmp r8, 24
jl _start+0x17

.data
var: .quad 0x93550000375a02ff, 0x50c28ba4cdce6be1 ,0x1a1a1a081cc7258d


