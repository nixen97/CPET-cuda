#include "main.h"
#include "main_kernel.h"

const char* testFunc(void)
{
	float data[128] = {0};
	float *result;

	test_gpu(data, result, 128);

	return "I am inside C";
}
