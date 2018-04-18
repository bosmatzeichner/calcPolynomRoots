#all: assembly.o main.o helper.o
#	gcc -g -Wall -o calc assembly.o main.o helper.o

all: main.o helper.o
	gcc -g -Wall -o calc main.o helper.o

#assembly.o: main.s main.o header.h
#	assembly -g -f elf64 -w+all -o assembly.o main.s

main.o: main.c computingRootsCalc.h
	gcc -g -Wall -c -o main.o main.c

helper.o:  calcFunctions.c computingRootsCalc.h
	gcc -g -Wall -c -o helper.o calcFunctions.c

.PHONY: clean

clean:
	rm -f *.o calc