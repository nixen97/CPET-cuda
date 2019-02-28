
VPATH=.
EXEC=Test
OBJDIR=../../build/test/bin-int/test/
OUTDIR=../../build/test/bin/
LIB=$(OUTDIR)libLib.so

# Base C-stuff
CC=gcc
CPP=g++
OPTS=-Ofast
LDFLAGS= -lm -pthread -Wl,-rpath,'$$ORIGIN' -s
COMMON= -DSTRIP_PYTHON -I../src
CFLAGS=-Wall -Wno-unused-result -Wno-unknown-pragmas -Wfatal-errors -fPIC

# OPTS=-O0 -g # <- Debug

CFLAGS+=$(OPTS)

# C-objects
OBJ=test.o

OBJS = $(addprefix $(OBJDIR), $(OBJ))
DEPS = $(wildcard ./*.h) Makefile

# Build all steps
all: obj $(EXEC)

# Link executable
$(EXEC): $(OBJS)
	$(CC) $(COMMON) $(CFLAGS) $^ -o $(OUTDIR)$@ $(LDFLAGS) $(LIB)

# Compile c
$(OBJDIR)%.o: %.c $(DEPS)
	$(CC) $(COMMON) $(CFLAGS) -c $< -o $@

obj:
	mkdir -p $(OBJDIR)

.PHONY: clean

clean:
	rm -rf $(OBJS) $(SLIB) $(ALIB) $(OBJDIR)/*