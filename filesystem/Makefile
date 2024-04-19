build:
	nasm -f elf -o main.o main.asm
	gcc -no-pie -m32 main.o -o main

lseek:
	nasm -f elf -o lseek.o lseek.asm
	gcc -no-pie -m32 lseek.o -o lseek

clean:
	rm -f *.o main lseek
