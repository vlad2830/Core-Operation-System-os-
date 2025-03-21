CC = gcc
ASM = nasm
LD = ld

CFLAGS = -m32 -ffreestanding -nostdlib -Wall -Wextra
ASMFLAGS = -f elf32
LDFLAGS = -m elf_i386 -T linker.ld

OBJS = kernel.o kernel_asm.o

all: kernel.bin

kernel.bin: $(OBJS)
	$(LD)	$(LDFLAGS) -o kernel.bin $(OBJS)

kernel.o: kernel.c
	$(CC) $(CFLAGS) -c kernel.c -o kernel.o

kernel_asm.o: kernel.asm
	$(ASM) $(ASMFLAGS)	kernel.asm -o kernel_asm.o

clean:
	rm -f *.o *.bin