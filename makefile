CC = clang
CFLAGS = -Wall -Wextra -g $(shell pkg-config --cflags glew glfw3)
LIBS = $(shell pkg-config --libs glew glfw3) -lGL -lm

TARGET = app
SRC = main.c

all: $(TARGET)

$(TARGET): $(SRC)
	$(CC) $(CFLAGS) -o $(TARGET) $(SRC) $(LIBS)

clean:
	rm -f $(TARGET)