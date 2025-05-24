cd src

i686-elf-gcc -I ~/opt/cross/lib/gcc/i686-elf/15.1.0/include -ffreestanding -Wall -Werror -m32 -nostdlib -nostdinc -fno-pie -fno-pic -fno-stack-protector -mno-red-zone -c kernel.c -o compiled/kernel.o
i686-elf-gcc -I ~/opt/cross/lib/gcc/i686-elf/15.1.0/include -ffreestanding -Wall -Werror -m32 -nostdlib -nostdinc -fno-pie -fno-pic -fno-stack-protector -mno-red-zone -c libs/print.c -o compiled/print.o
i686-elf-gcc -I ~/opt/cross/lib/gcc/i686-elf/15.1.0/include -ffreestanding -Wall -Werror -m32 -nostdlib -nostdinc -fno-pie -fno-pic -fno-stack-protector -mno-red-zone -c libs/log.c -o compiled/log.o
i686-elf-gcc -I ~/opt/cross/lib/gcc/i686-elf/15.1.0/include -ffreestanding -Wall -Werror -m32 -nostdlib -nostdinc -fno-pie -fno-pic -fno-stack-protector -mno-red-zone -c libs/serial.c -o compiled/serial.o
i686-elf-gcc -I ~/opt/cross/lib/gcc/i686-elf/15.1.0/include -ffreestanding -Wall -Werror -m32 -nostdlib -nostdinc -fno-pie -fno-pic -fno-stack-protector -mno-red-zone -c libs/io.c -o compiled/io.o
i686-elf-gcc -I ~/opt/cross/lib/gcc/i686-elf/15.1.0/include -ffreestanding -Wall -Werror -m32 -nostdlib -nostdinc -fno-pie -fno-pic -fno-stack-protector -mno-red-zone -c gdt/gdt.c -o compiled/gdt.o
i686-elf-gcc -I ~/opt/cross/lib/gcc/i686-elf/15.1.0/include -ffreestanding -Wall -Werror -m32 -nostdlib -nostdinc -fno-pie -fno-pic -fno-stack-protector -mno-red-zone -c terminal/terminal.c -o compiled/terminal.o
i686-elf-gcc -I ~/opt/cross/lib/gcc/i686-elf/15.1.0/include -ffreestanding -Wall -Werror -m32 -nostdlib -nostdinc -fno-pie -fno-pic -fno-stack-protector -mno-red-zone -c terminal/programs/exit.c -o compiled/exit.o
i686-elf-gcc -I ~/opt/cross/lib/gcc/i686-elf/15.1.0/include -ffreestanding -Wall -Werror -m32 -nostdlib -nostdinc -fno-pie -fno-pic -fno-stack-protector -mno-red-zone -c terminal/programs/version.c -o compiled/version.o
i686-elf-gcc -I ~/opt/cross/lib/gcc/i686-elf/15.1.0/include -ffreestanding -Wall -Werror -m32 -nostdlib -nostdinc -fno-pie -fno-pic -fno-stack-protector -mno-red-zone -c libs/string.c -o compiled/string.o
i686-elf-gcc -I ~/opt/cross/lib/gcc/i686-elf/15.1.0/include -ffreestanding -Wall -Werror -m32 -nostdlib -nostdinc -fno-pie -fno-pic -fno-stack-protector -mno-red-zone -c libs/keyboard.c -o compiled/keyboard.o
i686-elf-gcc -I ~/opt/cross/lib/gcc/i686-elf/15.1.0/include -ffreestanding -Wall -Werror -m32 -nostdlib -nostdinc -fno-pie -fno-pic -fno-stack-protector -mno-red-zone -c paging/paging.c -o compiled/paging.o
i686-elf-gcc -I ~/opt/cross/lib/gcc/i686-elf/15.1.0/include -ffreestanding -Wall -Werror -m32 -nostdlib -nostdinc -fno-pie -fno-pic -fno-stack-protector -mno-red-zone -c idt/idt.c -o compiled/idt.o
i686-elf-gcc -I ~/opt/cross/lib/gcc/i686-elf/15.1.0/include -ffreestanding -Wall -Werror -m32 -nostdlib -nostdinc -fno-pie -fno-pic -fno-stack-protector -mno-red-zone -c idt/isr.c -o compiled/isr.o
nasm -f elf32 boot.s -o compiled/boot.o
nasm -f elf32 mheaders.s -o compiled/mheaders.o
nasm -f elf32 gdt/gdt.s -o compiled/gdtasm.o
nasm -f elf32 paging/paging.s -o compiled/pagingasm.o
nasm -f elf32 idt/isr.s -o compiled/israsm.o

cd compiled

i686-elf-gcc -T ../linker.ld -o kernel.bin -ffreestanding -O2 -nostdlib *.o -lgcc --entry=_start

mv kernel.bin ../../isofiles/boot/kernel.bin

cd ../../

grub-mkrescue -o sun.iso isofiles