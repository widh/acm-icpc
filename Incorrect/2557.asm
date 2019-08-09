; Assembly x64
; Compile = nasm -f elf64 -o 2557.o 2557.asm && gcc -o 2557.elf64 2557.o && ./2557.elf64
; Possible cause = compilation environment (works very well on my WSL)

section .text
  global main

main:
  ; ASCII    \n! d l r
  mov rax, 0x0a21646c72
  push rax
  ; ASCII    o W   o l l e H
  mov rax, 0x6f57206f6c6c6548
  push rax

  mov rax, 1   ; Write
  mov rdx, 13  ; 13
  mov rsi, rsp ; bytes on stack
  mov rdi, 1   ; to stdout,
  syscall      ; kernel!

  mov rax, 60  ; Exit
  mov rdi, 0   ; with return zero
  syscall

  ret
