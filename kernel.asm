section .multiboot
align 4

multiboot_header:
    dd 0x1BADB002
    dd 0x00000003
    dd -(0x1BADB002 + 0x00000003)
    
section .text
global _start 

extern kernel_main

_start:
    mov esp, stack_top
    call kernel_main

    ;Бесконечный цикл (если возращается kernel_main)
    cli
    hlt

section .bss
align 16
stack_bottom:
    resb 16384 
stack_top: