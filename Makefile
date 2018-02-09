LIBS = -L/usr/local/lib -lpcap

all: libsess3.so uselib

libsess3.so: sess3.c sess3.h
	gcc -c -Wall -Werror -fpic sess3.c
	gcc -shared -o libsess3.so sess3.o

uselib: uselib.c libsess3.so
	gcc -L$(PWD) uselib.c -o uselib -lsess3

tryshared: tryshared.c libsess3.so
	gcc -L$(PWD) tryshared.c -o tryshared -lsess3
