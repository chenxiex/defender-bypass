CFLAGS = -Wall -Wextra -O0 -static
CC = cl
BUILD_DIR = build

.PHONY: all clean

all: $(BUILD_DIR)/encode.exe $(BUILD_DIR)/main.exe

$(BUILD_DIR):
	@mkdir -p $(BUILD_DIR)

$(BUILD_DIR)/encode.exe: encode.o $(BUILD_DIR)
	$(CC) $(CFLAGS) -o $(BUILD_DIR)/encode.exe encode.o

encode.o: encode.c
	$(CC) $(CFLAGS) -c encode.c

$(BUILD_DIR)/main.exe: main.o $(BUILD_DIR)
	$(CC) $(CFLAGS) -o $(BUILD_DIR)/main.exe main.o

main.o: main.c
	$(CC) $(CFLAGS) -c main.c

clean:
	rm -f build/*
	rm -f *.o