.PHONY=clean run test cov

CC=gcc

GCOV=gcov

TESTPATH=testing/

CFLAGS=-Wall -Wextra -pedantic -g

COVFLAGS=-ftest-coverage -fprofile-arcs

TARGET:=main

SRCS=$(wildcard *.c)

OBJ=$(SRCS:%.c=%.o)

BINS=$(TARGET) $(OBJ)

%.o: %.c
	$(CC) -c -o $@ $^ $(CFLAGS)

$(TARGET): $(OBJ)
	$(CC) -o $@ $^ $(CFLAGS) $(COVFLAGS)

test:
	$(MAKE) -C $(TESTPATH) 
	$(MAKE) -C $(TESTPATH) run

cov:
	@$(GCOV) $(TARGET)

run:
	./$(TARGET)

clean:
	rm -rf $(BINS) $(OBJ)
