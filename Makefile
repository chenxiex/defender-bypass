CFLAGS = -Wall -Wextra -O0 -static
CC = cl

PLATFORM ?= windows

ifeq ($(PLATFORM), windows)
	CC = cl
else ifeq ($(PLATFORM), mingw)
	CC = x86_64-w64-mingw32-gcc
endif

.PHONY: all clean mkdir

all: encode main

mkdir:
	@mkdir -p build

encode: encode.o mkdir
	$(CC) $(CFLAGS) -o build/encode encode.o

encode.o: encode.c
	$(CC) $(CFLAGS) -c encode.c

main: main.o mkdir
	$(CC) $(CFLAGS) -o build/main main.o

main.o: main.c
	$(CC) $(CFLAGS) -c main.c

clean:
	rm -f build/*
	rm -f *.o