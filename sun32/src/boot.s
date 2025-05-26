bits 32 ; 32 bit mode

section .bss ; memory that gets set to zero when compiled.
stack_top:
    resb 131072
stack_end: ; setup the stack in memory

extern kernel_main ; extern the kernel_main function to get to C

global _start ; making start global 

section .text   ; where code actually goes - NEVER put it in BSS!!!!
_start: ; start function
        mov esp, stack_end  ; set up the stack
        call kernel_main