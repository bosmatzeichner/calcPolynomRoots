all: main.o calcFunctions.o calcFunctions.o
	gcc -g -Wall -o calc main.o calcFunctions.o calcFunctions2.o
main.o: main.c computingRootsCalc.h
	gcc -g -Wall -c -o main.o main.c
	
#calcFunctions.o: calcFunctions.c computingRootsCalc.h
#	gcc -g -Wall -c -o calcFunctions.o calcFunctions.c

calcFunctions.o: calcFunctions.s computingRootsCalc.h
	nasm -g -f elf64 -w+all -o calcFunctions.o calcFunctions.s
.PHONY: clean
clean:
	rm -f *.o calc
