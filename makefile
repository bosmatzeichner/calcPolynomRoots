all: calcRoot.o
	gcc -g -Wall -o root calcRoot.o

calcRoot.o: calcRoot.s
	nasm -g -f elf64 -w+all -o calcRoot.o calcRoot.s
.PHONY: clean
clean:
	rm -f *.o root
