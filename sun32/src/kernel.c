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
#include "terminal/programs/exit.h"
#include "libs/serial.h"

extern unsigned int gdtinc;
extern unsigned int pageinc;
extern unsigned int idtinc;

void kernel_main() {
    clear();
    serial_init();
    info("Kernel is UP!\n");
    success("Serial is UP!\n");
    serial_print("serial up\n");

    success("Running in protected mode.\n");

    gdt_setup();

    if(gdtinc == 1) {
        success("GDT has loaded\n");
        serial_print("GDT load\n");
    } else {
        fatal("The GDT failed to load.\n");
        serial_print("GDT fail\n");
        halt();
    }

    page_table_setup();
    loadPageDirectory(page_directory);
    enablePaging();

    if(pageinc == 1){
        success("Paging has started - up to 4GB RAM addressable\n");
        serial_print("Paging load\n");
    } else {
        fatal("Paging failed to start.\n");
        serial_print("Paging fail\n");
        halt();
    }

    idt_init();

    if(idtinc == 1){
        success("IDT has started\n");
        serial_print("IDT load\n");
    } else {
        fatal("IDT failed to start.\n");
        serial_print("IDT fail\n");
    }
    terminal();
}