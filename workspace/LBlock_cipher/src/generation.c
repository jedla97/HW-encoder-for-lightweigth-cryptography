#include "generation.h"

const char* generate_key(int lenght) {
	char * ret = "";
	if (LENGHT_OF_KEY) {
		for (int n = 0; n < LENGHT_OF_KEY; n++) {
			int key = rand() % (int) (sizeof(charset) - 1);
			ret[n] = charset[key];
		}
		ret[LENGHT_OF_KEY + 1] = '\0';
	}
	return ret;
}

unsigned int key_to_integer(int lenght) {
	const char * key = generate_key(lenght);
	int i = 0;
	unsigned int string_to_integer = 0;
	for (i = 0; i < lenght; i++) {
		string_to_integer = (string_to_integer << 8) | key[i];
	}
	return string_to_integer;
}

unsigned int generate_inicialization_vector(int lenght) {
	XGpio input;
	u32 data_out;
	XGpio_Initialize(&input, XPAR_AXI_GPIO_1_DEVICE_ID);
	XGpio_SetDataDirection(&input, 1, 0xffffffff);
	data_out = XGpio_DiscreteRead(&input, 1);
	//data_out = Xil_In32(XPAR_LBLOCK_WRAPPER_0_S00_AXI_BASEADDR + 28);
	xil_printf("%08X\n", data_out);
	return data_out;
}

