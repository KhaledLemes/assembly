.intel_syntax noprefix
.global _start
.text

_start:
mov rax, 0 # Makes rax 0
add rax, 22 # Adds 22 to rax (0+22 = 22)
sub rax, 22 # Subtracts 22 from rax (22-22 = 0)

inc rax # Increments rax (rax++)
dec rax # Decrements rax (rax--)

