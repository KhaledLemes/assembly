.intel_syntax noprefix
.global _start

.text
	
_start:
	;# Prints the first message
	lea rsi, [stmsg]
	lea rdx, [stlen]
	call print
	
	lea rsi, [buf]
	mov rdx, 128
	call read

	mov byte ptr [buf+128], 0x00 ;# Makes the 128th byte of the buffer \0 to avoid overflow

  ;# APAGAR
  lea rsp, [buf]
  ;# APAGAR

	lea rdi, [buf] ;# Argument for strlen function
	call strlen

	lea rsi, [buf]
	mov rdx, 128
	call print
	
	call .exit
	
strlen:
  xor r8b, r8b ;# i = 0
	.iteration:
    mov r9b, [rdi] ;# r9b holds the current char

    ;# if (c == '\0' || char == '\n') {return}
		cmp r9b, 0x00
		jz .lenret
		cmp r9b, 0x0a
		jz .lenret
    
    ;# charptr++; i++
		inc rdi
		inc r8b
		jmp .iteration	

	.lenret:
  ;# Puts the len to [len] addres
	mov rax, r8b
	ret

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

.exit:
	mov rax, 60
	mov rdi, 0
	syscall

.data

stmsg: .asciz "Insert the string you want to measure (up to 127 digits):\n" 
	stlen = . - stmsg

buf: .skip 128, 0x00

len: .byte

