DEBUG=-ggdb -Og -g3
RELEASE=-O3
type=debug
ifeq (${type},debug)
	TYPE=${DEBUG}
else
	ifeq (${type},release)
		TYPE=${RELEASE}
	endif
endif

WARNINGS=-Wall -Wextra -Wpedantic
STANDARD=-std=c++17
ARGS=${WARNINGS} ${STANDARD} ${TYPE}
SHARED=-fPIC

RAPID_XML=-isystem ../..
FILESYSTEM=-lstdc++fs

all_basic: main.o TemperatureData.o TemperatureReader.o ../EmptyContainerException.hpp
	clang++ main.o TemperatureData.o TemperatureReader.o ${FILESYSTEM}

all_static: main.o ../static/libTemperatureReader.a ../EmptyContainerException.hpp
	clang++ main.o -L ../static -l TemperatureReader ${FILESYSTEM}

all_shared: main.o ../shared/libTemperatureReader.so ../EmptyContainerException.hpp
	clang++ main.o -L ../shared -l TemperatureReader ${FILESYSTEM} -Wl,-rpath=$(HOME)/Programming/C++/TemperatureBot/TemperatureReader/shared

echo:
	@echo ${ARGS}

../static/libTemperatureReader.a: TemperatureData.o TemperatureReader.o
	ar rvs ../static/libTemperatureReader.a TemperatureData.o TemperatureReader.o

../shared/libTemperatureReader.so: TemperatureData.shared.o TemperatureReader.shared.o
	clang++ -shared TemperatureData.shared.o TemperatureReader.shared.o -o ../shared/libTemperatureReader.so

TemperatureData.shared.o: ../TemperatureData.cpp
	clang++ -c ${SHARED} ../TemperatureData.cpp ${ARGS} -o TemperatureData.shared.o

TemperatureReader.shared.o: ../TemperatureReader.cpp
	clang++ -c ${SHARED} ../TemperatureReader.cpp ${ARGS} ${RAPID_XML} -o TemperatureReader.shared.o

TemperatureData.o: ../TemperatureData.cpp
	clang++ -c ../TemperatureData.cpp ${ARGS}

TemperatureReader.o: ../TemperatureReader.cpp
	clang++ -c ../TemperatureReader.cpp ${ARGS} ${RAPID_XML}

main.o : ../main.cpp
	clang++ -c ../main.cpp ${ARGS}

clean:
	rm -f *.o
	rm -f a.out
	rm -f ../static/*.a
	rm -f ../shared/*.so
