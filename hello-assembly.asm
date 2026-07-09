.intel_syntax noprefix
.global _start
.text
_start:

mov rax, 1 ;# Desired syscall (write)
mov rdi, 1 ;# arg0 - stdout
lea rsi, [var] ;# arg1 - string to write to stdout
lea rdx, [len] ;# arg2, lenght of this string
syscall ;# Executes the syscall stored in rax with the arguments

mov rax, 60 ;# Desired syscall (exit)
mov rdi, 0 ;# arg0 - error code
syscall

.data

var:
 .ascii "Hello, world!"
 len = . - var
