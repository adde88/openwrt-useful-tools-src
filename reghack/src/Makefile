INSTALLDIR	= /sbin

HOSTOS := $(shell uname -s)

CC	= gcc
#CFLAGS = -std=gnu99 -O3 -Wall -Wextra
INSTFLAGS = -m 0755

ifeq ($(HOSTOS), Linux)
INSTFLAGS += -D
endif

all: build

build:
ifeq ($(HOSTOS), Linux)
	$(CC) $(CFLAGS) -o reghack reghack.c $(LFLAGS)
endif


install: build
ifeq ($(HOSTOS), Linux)
	install $(INSTFLAGS) reghack $(INSTALLDIR)/reghack
endif

ifeq ($(HOSTOS), Linux)
	rm -f reghack
endif
	rm -f *.o *~


clean:
ifeq ($(HOSTOS), Linux)
	rm -f reghack
endif
	rm -f *.o *~


uninstall:
ifeq ($(HOSTOS), Linux)
	rm -f $(INSTALLDIR)/reghack
endif
