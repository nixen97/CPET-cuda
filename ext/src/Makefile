
ARCH = -gencode arch=compute_30,code=sm_30 \
       -gencode arch=compute_35,code=sm_35 \
       -gencode arch=compute_50,code=[sm_50,compute_50] \
       -gencode arch=compute_52,code=[sm_52,compute_52]

VPATH=.
SLIB=libLib.so
ALIB=libLib.a
OBJDIR=../../build/test/bin-int/lib/
OUTDIR=../../build/test/bin/

# Base C-stuff
CC=gcc
CPP=g++
NVCC=nvcc
AR=ar
ARFLAGS=rcs
OPTS=-Ofast
LDFLAGS= -lm -pthread -lc
COMMON= -DEXT_SO -DSTRIP_PYTHON
CFLAGS=-Wall -Wno-unused-result -Wno-unknown-pragmas -Wfatal-errors -fPIC

# OPTS=-O0 -g # <- Debug

CFLAGS+=$(OPTS)

# CUDA
COMMON+= -I/usr/local/cuda/include/
LDFLAGS+= -L/usr/local/cuda/lib64 -lcuda -lcudart -lcublas -lcurand

# CUDNN
LDFLAGS+= -lcudnn

# C-objects
OBJ=main.o ext.o

# CUDA-objects
# LDFLAGS+= -lstdc++ # <- Unsure if this is required
OBJ+=main_kernel.o

OBJS = $(addprefix $(OBJDIR), $(OBJ))
DEPS = $(wildcard ./*.h) Makefile

# Build all steps
all: obj $(SLIB) $(ALIB)

# Link static lib
$(ALIB): $(OBJS)
	$(AR) $(ARFLAGS) $(OUTDIR)$@ $^

# Link shared lib
$(SLIB): $(OBJS)
	$(CC) -o $(OUTDIR)$@ $^ -shared $(LDFLAGS) -Wl,-soname=libLib.so -s

# Compile cpp (Not currently supported)
# $(OBJDIR)%.o: %.cpp $(DEPS)
#   $(CPP) $(COMMON) $(CFLAGS) -c $< -o $@

# Compile c
$(OBJDIR)%.o: %.c $(DEPS)
	$(CC) $(COMMON) $(CFLAGS) -c $< -o $@

# Compile cuda
$(OBJDIR)%.o: %.cu $(DEPS)
	$(NVCC) $(ARCH) $(COMMON) --compiler-options "$(CFLAGS)" -c $< -o $@

obj:
	mkdir -p $(OBJDIR)

.PHONY: clean

clean:
	rm -rf $(OBJS) $(SLIB) $(ALIB) $(OBJDIR)/*