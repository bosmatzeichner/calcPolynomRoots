all: add.o
	gcc -g -Wall -o calc add.o

#main.o: main.c computingRootsCalc.h
#	gcc -g -Wall -c -o main.o main.c

#calcFunctions.o: calcFunctions.c computingRootsCalc.h
#	gcc -g -Wall -c -o calcFunctions.o calcFunctions.c

add.o: add.s
	nasm -g -f elf64 -w+all -o add.o add.s
.PHONY: clean
clean:
	rm -f *.o calc
