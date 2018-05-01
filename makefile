all: root.o
	gcc -g -Wall -o root root.o

root.o: calcRoot.s
	nasm -g -f elf64 -w+all -o root.o calcRoot.s
.PHONY: clean
clean:
	rm -f *.o calcRoot
