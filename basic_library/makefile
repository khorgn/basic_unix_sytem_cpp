CC=clang++
CFLAGS= -gfull -Wall -Weffc++ -Wextra -Wsign-conversion -pedantic-errors
LIBS=-lbasiclib


main: main.o
	$(CC) $(CFLAGS) -o $@ $< $(LIBS)

clean:
	rm -f *.o a.out