#include <stdint.h>
#include <stddef.h>

uint32_t page_directory[1024] __attribute__((aligned(4096)));
uint32_t page_tables[1024][1024] __attribute__((aligned(4096)));
unsigned int pageinc = 0;

void page_table_setup() {
    for (uint32_t i = 0; i < 1024; i++) {
        for (uint32_t j = 0; j < 1024; j++) {
            uint32_t addr = (i * 0x400000) + (j * 0x1000);
            page_tables[i][j] = addr | 0x3;
        }
        page_directory[i] = ((uint32_t)page_tables[i]) | 0x3;
        pageinc = 1;
    }
}
