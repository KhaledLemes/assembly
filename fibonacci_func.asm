.intel_syntax noprefix
.global _start
.text

_start:
 lea rsi, [stmsg]
 lea rdx, [lenst]
 call print ;# Prints first msg

 lea rsi, [opt]
 mov rdx, 1 ;# Reads 1 byte
 call read

 mov r8b, [opt] ;# r8 holds the option
 sub r8b, 0x30 ;# turns 1 digit values to numeric chars

 lea rsi, [opt]
 mov rdx, 1
 call print ;# Prints the amount of iterations the user has decided to run

 .setnums:
 xor r15, r15 ;# Prepares and run fibonacci sequence function
 mov r10b, 0
 mov r11b, 1
 mov r12b, 0
 call fibonacci

.exit:
 mov rax, 60
 mov rdi, 0
 syscall

print:
 mov rax, 1
 mov rdi, 1
 syscall
 ret

read:
 mov rax, 0
 mov rdi, 0
 syscall
 ret

fibonacci:
 mov r12b, r11b
 add r12b, r10b
 mov r10b, r11b
 mov r11b, r12b
 ;# Calculates and add to register next fibonacci sequence number

 .cmpiter:  ;# while (i < r8)
  cmp r15b, r8b
  jl .pcurrent 
  ret ;# i >= r8

 .pcurrent:
  add r12, 0x30 ;# Only works for 1 digit numbers. Need to create an atoi func
  mov [num], r12
  
  lea rsi, [num]
  lea rdx, [nlen]
  
  call print
  inc r15
  jmp fibonacci


.data
stmsg: .ascii "Please inform how many iterations your fibonacci sequence is gonna have: "
lenst = . - stmsg

opt: .byte

num: .word
nlen = 2
