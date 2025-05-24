ENTRY(_start)

SECTIONS {

    . = 2M;

    .boot :
    {
        *(.multiboot_header)
    }

    .bss :
    {
        *(.bss)

        *(COMMON)
       . = ALIGN(4096);
    }

    .text :
    {
        *(.text)
    }

    .data :
    {
        *(.data)
    }

    .rodata :
    {
        *(.rodata)
    }
}