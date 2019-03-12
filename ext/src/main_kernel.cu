#include <stdlib.h>
#include <stdio.h>

#include <cuda.h>
#include <builtin_types.h>
#include "cuda_runtime.h"
#include "curand.h"
#include "cublas_v2.h"

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
    data[idx]++;
}

#ifdef __cplusplus
extern "C" {
#endif
void test_gpu(float *h_data, const int length)
{
    float *d_data;
    int b_length = length * sizeof(int);
    checkCudaErrors(cudaMalloc(&d_data, b_length));
    
    checkCudaErrors(cudaMemcpy(d_data, h_data, b_length, cudaMemcpyHostToDevice));
    
    // Run kernel
    testKernel<<< length, 1 >>>(d_data, length);

    checkCudaErrors(cudaMemcpy(h_data, d_data, b_length, cudaMemcpyDeviceToHost));
    checkCudaErrors(cudaFree(d_data));
}
#ifdef __cplusplus
}
#endif
