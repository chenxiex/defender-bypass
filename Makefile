CFLAGS = -Wall -Wextra -O0 -static

PLATFORM ?= windows

ifeq ($(PLATFORM), windows)
	CC = cl
	WIN_CC = ${CC}
else ifeq ($(PLATFORM), mingw)
	CC = gcc
	WIN_CC = x86_64-w64-mingw32-gcc
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
	$(WIN_CC) $(CFLAGS) -o build/main main.o

main.o: main.c
	$(WIN_CC) $(CFLAGS) -c main.c

clean:
	rm -f build/*
	rm -f *.o