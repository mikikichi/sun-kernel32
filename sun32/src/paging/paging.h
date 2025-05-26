#ifndef PAGING_H
#define PAGING_H

#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

extern uint32_t page_directory[4096] __attribute__((aligned(4096)));
extern uint32_t table1[4096] __attribute__((aligned(4096)));
void page_table_setup(void);

extern void loadPageDirectory(uint32_t* dir);
extern void enablePaging(void);

#endif