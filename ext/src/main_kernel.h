#ifndef MAIN_KERNEL_H
#define MAIN_KERNEL_H

#include "cuda_runtime.h"
#include "curand.h"
#include "cublas_v2.h"
#include "cudnn.h"

void test_gpu(const float *data, const float *result, const int length);

#endif