#include "main_kernel.h"

__global__ void testKernel(const float *data, const float *result, const int l)
{
    index = blockIdx.x*blockDim.x+threadIdx.x;
    if (index < l)
        result[index] = data[index]++;
}

void test_gpu(const float *data, const float *result, const int length)
{
    // Allocate memory on device
    float *d_data, *d_result
    
    checkCudaErrors(cudaMalloc(&d_data, length));
    checkCudaErrors(cudaMalloc(&d_result, length));

    // Copy data to device
    checkCudaErrors(cudaMemcpy(d_data, data, length, cudaMemcpyHostToDevice));

    // Run kernel
    testKernel<<< 512, 1024 >>>(d_data, d_result, length);

    // Copy result back
    checkCudaErrors(cudaMemcpy(result, d_result, length, cudaMemcpyDeviceToHost));

    // Free device memory
    checkCudaErrors(cudaFree(d_data));
    checkCudaErrors(cudaFree(d_result));
}