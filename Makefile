OS=$(shell uname -s)
ARCH=$(shell uname -m)
NASM_FLAGS=

ifeq (${OS}, Darwin)
	CC=/opt/local/bin/gcc-mp-5
	FORMAT=macho64
	TARGET=printf64
	NASM_FLAGS=--prefix _
endif

ifeq (${OS}, Linux)
ifeq (${ARCH}, x86_64)
	FORMAT=elf64
	TARGET=printf64
endif
endif

ifndef FORMAT
	FORMAT=elf
	TARGET=printf32
endif

all: clean ${TARGET}

printf32: printf32.o
	${CC} -g -o printf32 printf32.o

printf64: printf64.o
	${CC} -m64 -g -o printf64 printf64.o

printf32.o:
	nasm ${NASM_FLAGS} -f ${FORMAT} printf32.asm

printf64.o:
	nasm ${NASM_FLAGS} -f ${FORMAT} printf64.asm

clean:
	rm -f *.o printf64 printf32
