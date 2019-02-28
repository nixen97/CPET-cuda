#include <stdlib.h>
#include "main.h"
#include "main_kernel.h"

const char* testFunc(void)
{
	float data[128] = {0};

	test_gpu(data, 128);

	return "I am inside C";
}
