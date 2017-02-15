CC = gcc
CFLAGS = -std=c99

all : ex3

%c:%y
		bison $<

%o:%c
		$(CC) $(CFLAGS) -o $@ $<

%c:%l
		flex -o $@ $<

ex3 : ex3.o
