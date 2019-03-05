#include <stdlib.h>
#include <stdio.h>

#include <cuda.h>
#include <builtin_types.h>
#include "cuda_runtime.h"
#include "curand.h"
#include "cublas_v2.h"
#include "cudnn.h"

#ifdef __cplusplus
extern "C" {
#endif
#include "main_kernel.h"
#ifdef __cplusplus
}
#endif


// Error handling
#define checkCudaErrors(err) __checkCudaErrors(err, __FILE__, __LINE__)

inline void __checkCudaErrors(cudaError_t err, const char *file, const int line)
{
    if ( cudaSuccess != err) {
        fprintf(stderr,
            "CUDA Driver API error = %04d from file <%s>, line %i.\n",
            err, file, line);
        exit(-1);
    }
}


__global__ void testKernel(float *data, const int l)
{
    int idx = blockIdx.x*blockDim.x+threadIdx.x;
    if (idx < l)
        data[idx]++;
}

#ifdef __cplusplus
extern "C" {
#endif
void test_gpu(float *data, const int length)
{
    // Run kernel
    testKernel<<< 512, 1024 >>>(data, length);
}
#ifdef __cplusplus
}
#endif
