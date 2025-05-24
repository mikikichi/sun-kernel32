#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>
#include "paging.h"

uint32_t page_directory[1024] __attribute__((aligned(4096)));
uint32_t table1[1024] __attribute__((aligned(4096)));

void page_table_setup() {
    for (unsigned int i = 0; i < 1024; i++) {
        page_directory[i] = 0;
    }

    for (unsigned int i = 0; i < 1024; i++) {
        table1[i] = (i * 0x1000) | 3;
    }

    page_directory[0] = ((unsigned int)table1) | 3;
}