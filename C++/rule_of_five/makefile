ELIDE = YES
ifneq ($(ELIDE),YES)
	ARGS = -fno-elide-constructors
endif

all : main.o string.o
	clang++ main.o string.o -o a.out $(ARGS)

main.o : string.o string.hpp main.cpp
	clang++ -c main.cpp $(ARGS)

string.o : string.cpp string.hpp
	clang++ -c string.cpp $(ARGS)

clean :
	rm -f *.o *~ a.out

