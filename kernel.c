#define VGA_WIDTH 80
#define VGA_HEIGHT 25

volatile unsigned char* vga_buffer = (unsigned char*)0xB8000;

void clear_screen() {
    for (int i = 0; i < VGA_WIDTH * VGA_HEIGHT; i++) {
        vga_buffer[i * 2] = ' ';
        vga_buffer[i * 2 + 1] = 0x07;
    }
}

void print_string(const char* str, int x, int y) {
    int index = (y * VGA_WIDTH + x);
    for (int i = 0; str[i] != '\0'; i++) {
        vga_buffer[index * 2] = str[i];
        vga_buffer[index * 2 + 1] = 0x07;
        index++;
    }
}

void kernel_main() {
    clear_screen();
    print_string("Hello, World!", 0, 0);

    while (1) {}
}
    


        
