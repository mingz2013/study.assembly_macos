.text
.intel_syntax noprefix
.globl _main
.align 4, 0x90

_main:
    push rbp
    mov rbp, rsp
    lea rdi, [rip + L_.str]
    call _puts
    xor eax, eax
    pop rbp
    ret

.cstring
L_.str:
    .asciz "hello, world\n"
