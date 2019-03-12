#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>
#include "main_kernel.h"
#include "main.h"

int testFunc(void)
{
	float data[128] = {0};

	test_gpu(data, 128);
	bool OK = true;
	for(int i = 0; i < 128; i++) {
		if (data[i] != 1.0f)
		{
			OK = false;
			printf("WRONG VALUE AT INDEX %i: %f\n", i, data[i]);
		}
	}
	if (OK)
		printf("CUDA ran succesfully\n");
	else
		printf("CUDA did not run succesfully\n");
	
	return 1;
}