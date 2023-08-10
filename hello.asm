section .data
    hello db 'Hello, World!', 0

section .text
    global _start

_start:
    ; write hello to stdout
    mov eax, 1
    mov edi, 1
    mov rsi, hello
    mov rdx, 13
    syscall

    ; exit
    mov eax, 60
    xor edi, edi
    syscall
