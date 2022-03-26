.PHONY=clean run test cov

CC=gcc

COV=gcov

COVR=gcovr

TESTPATH=testing/

CFLAGS=-Wall -Wextra -pedantic -g

COVFLAGS=-ftest-coverage -fprofile-arcs

CVRFLAGS=-r . --html --html-details

TARGET:=main

SRCS=$(wildcard *.c)

OBJ=$(SRCS:%.c=%.o)

BINS=$(TARGET) $(OBJ)

#Generate single object file for each c file
%.o: %.c
	$(CC) -c -o $@ $^ $(CFLAGS)

#Create Main Target from all object files
$(TARGET): $(OBJ)
	$(CC) -o $@ $^ $(CFLAGS) $(COVFLAGS)

test:
	$(MAKE) -C $(TESTPATH) 
	$(MAKE) -C $(TESTPATH) run

cov:
	@$(COV) $(TARGET)

run:
	./$(TARGET)

report:
	$(COVR) $(CVRFLAGS) -o covr.html
	firefox covr.html

clean:
	rm -rf $(BINS) $(OBJ)
