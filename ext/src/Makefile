
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
COMMON= -DEXT_SO
CFLAGS=-Wall -Wno-unused-result -Wno-unknown-pragmas -Wfatal-errors

# OPTS=-O0 -g # <- Debug

CFLAGS+=$(OPTS)

# CUDA
COMMON+= -I/usr/local/cuda/include/
LDFLAGS+= -L/usr/local/cuda/lib64 -lcuda -lcudart -lcublas -lcurand

# CUDNN
LDFLAGS+= -lcudnn

# C-objects
OBJ=main.o

# CUDA-objects
# LDFLAGS+= -lstdc++ # <- Unsure if this is required
OBJ_CUDA=main_kernel.o
CUDA_HOST=main_kernel_h.o

OBJS = $(addprefix $(OBJDIR), $(OBJ))
OBJS_CUDA = $(addprefix $(OBJDIR), $(OBJ_CUDA))
OBJS_HOST = $(addprefix $(OBJDIR), $(CUDA_HOST))
DEPS = $(wildcard ./*.h) Makefile

# Build all steps
all: obj $(OBJS) $(OBJS_HOST) $(OBJS_CUDA) $(ALIB)

# Link static lib
$(ALIB): $(OBJS_CUDA) $(OBJS_HOST) $(OBJS)
	$(AR) $(ARFLAGS) $(OUTDIR)$@ $^

# Compile c
$(OBJDIR)%.o: %.c $(DEPS)
	$(CC) $(COMMON) $(CFLAGS) -c $< -o $@

# Compile cuda-hostcode
$(OBJDIR)%_h.o: %.cu $(DEPS)
	$(NVCC) $(ARCH) -c -rdc=true --compiler-options "$(CFLAGS)" $< -o $@

# Device Link device code	
$(OBJDIR)%.o: $(OBJDIR)%_h.o $(DEPS)
	$(NVCC) $(ARCH) -dlink -o $@ $< -lcuda -lcudart -lcublas -lcurand -lcudnn

obj:
	mkdir -p $(OBJDIR)

.PHONY: clean

clean:
	rm -rf $(OBJS) $(ALIB) $(OBJDIR)/*