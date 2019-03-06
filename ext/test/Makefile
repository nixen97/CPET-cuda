
VPATH=.
EXEC=Test
OBJDIR=../../build/test/bin-int/test/
OUTDIR=../../build/test/bin/
LIB=$(OUTDIR)libLib.a

# Base C-stuff
CC=gcc
CPP=g++
OPTS=-Ofast
LDFLAGS= -L/usr/local/cuda/lib64 -lcuda -lcudart -lcublas -lcurand -lcudnn -Wl,-rpath,'$$ORIGIN' -s
CFLAGS= -MMD -MP -DNDEBUG -DSTRIP_PYTHON -I../src -Wno-unused-result -Wno-unknown-pragmas -Wfatal-errors

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
	$(CC) $^ -o $(OUTDIR)$@ $(LIB) $(LDFLAGS)

# Compile c
$(OBJDIR)%.o: %.c $(DEPS)
	$(CC) $(CFLAGS) -c $< -o $@

obj:
	mkdir -p $(OBJDIR)

.PHONY: clean

clean:
	rm -rf $(OBJS) $(OBJDIR)/*