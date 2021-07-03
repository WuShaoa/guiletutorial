# Basic Makefile for the tortoise package.

CFLAGS = `guile-config compile` #needs guile-dev
LIBS = `guile-config link` -lm

.PHONY: clean build run

build: tortoise

clean:
	rm -f tortoise tortoise.o

run: tortoise
	./tortoise

tortoise: tortoise.o #use -lm to link libm.so
	gcc $< -o $@ $(LIBS)

tortoise.o: tortoise.c
	gcc -c $< -o $@ $(CFLAGS)