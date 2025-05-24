; exception handling macros for 32-bit x86

%macro isr_err_stub 1
isr_stub_%+%1:
    push eax
    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp

    push dword %1        ; push exception number as argument
    call exception_handler
    add esp, 4           ; clean up stack

    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop eax

    iret
%endmacro

%macro isr_no_err_stub 1
isr_stub_%+%1:
    push eax
    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp

    push dword %1
    call exception_handler
    add esp, 4

    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop eax

    iret
%endmacro

; exception handlers
extern exception_handler

isr_no_err_stub 0
isr_no_err_stub 1
isr_no_err_stub 2
isr_no_err_stub 3
isr_no_err_stub 4
isr_no_err_stub 5
isr_no_err_stub 6
isr_no_err_stub 7
isr_err_stub    8
isr_no_err_stub 9
isr_err_stub    10
isr_err_stub    11
isr_err_stub    12
isr_err_stub    13
isr_err_stub    14
isr_no_err_stub 15
isr_no_err_stub 16
isr_err_stub    17
isr_no_err_stub 18
isr_no_err_stub 19
isr_no_err_stub 20
isr_no_err_stub 21
isr_no_err_stub 22
isr_no_err_stub 23
isr_no_err_stub 24
isr_no_err_stub 25
isr_no_err_stub 26
isr_no_err_stub 27
isr_no_err_stub 28
isr_no_err_stub 29
isr_err_stub    30
isr_no_err_stub 31

%assign i 32
%rep 224
    isr_no_err_stub i
%assign i i+1
%endrep


section .data
; stub table
global isr_stub_table
isr_stub_table:
%assign i 0
%rep 256
    dd isr_stub_%+ i
%assign i i+1
%endrep
