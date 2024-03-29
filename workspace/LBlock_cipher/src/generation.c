#include "generation.h"

unsigned int generate_random_bits() {
	XGpio input;
	unsigned int data_out;
	XGpio_Initialize(&input, XPAR_AXI_GPIO_1_DEVICE_ID);
	XGpio_SetDataDirection(&input, 1, 0xffffffff);
	data_out = XGpio_DiscreteRead(&input, 1);
	return data_out;
}

