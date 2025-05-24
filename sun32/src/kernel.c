#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>
#include "libs/print.h"
#include "libs/log.h"
#include "libs/serial.h"
#include "gdt/gdt.h"
#include "terminal/terminal.h"
#include "paging/paging.h"
#include "idt/idt.h"

extern unsigned int gdtinit;

void kernel_main() {
    clear();
    serial_init();
    success("Serial is UP!\n");
    success("Kernel is UP!\n");

    gdt_setup();

    terminal();
}