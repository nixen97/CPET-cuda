#ifndef MAIN_KERNEL_H
#define MAIN_KERNEL_H

#include "common.h"

__attribute__((visibility("hidden"))) void test_gpu(float *data, const int length);

#endif