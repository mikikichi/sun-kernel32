#ifndef GDT_H
#define GDT_H

#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

void gdt_setup();
extern struct gdt_pointer gdtp;
extern unsigned int gdtinit;

#endif