.PHONY: clean run

CC=g++

CFLAGS=-Wall -Wextra -pedantic

TESTFLAGS=-lgtest -lgtest_main -pthread

FILE_MAIN_C:=../main.c

SRCS_C:=$(filter-out $(FILE_MAIN_C), $(wildcard ../*.c))

SRCS_CXX:=$(wildcard *.cxx)

OBJ_C:=$(SRCS_C:%.c=%.o) 
_OBJ_C:=$(patsubst %, ../%, $(OBJ_C))

OBJ_CXX=$(SRCS_CXX:%.cxx=%.o)

TARGET:=main_testing

all: $(TARGET) $(OBJ_CXX) $(OBJ_C)

$(TARGET): $(SRCS_C) $(SRCS_CXX)
	$(CC) -o $@ $^ $(CFLAGS) $(TESTFLAGS)

clean:
	rm -rf $(TARGET) *.o

run: 
	./$(TARGET)

show:
	echo $(filter-out ../main.c, $(wildcard ../*.c))

