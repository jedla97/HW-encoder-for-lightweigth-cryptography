#include "xparameters.h"
#include "xil_io.h"
#include "xil_types.h"
#include "xil_assert.h"
#include "xgpiops_hw.h"
#include "xgpio.h"
#include "sdcard_operations.h"
#include "key_generation.h"
//#include "xbasic_types.h"
int main() {

	u32 data_out1;
	u32 data_out2;
	u32 data_in1;
	u32 data_in2;
	u32 data_key1;
	u32 data_key2;
	u32 data_key3;

	XGpio input;
	int button_data = 0;
	xil_printf("start\n");
	XGpio_Initialize(&input, XPAR_AXI_GPIO_0_DEVICE_ID);
	XGpio_SetDataDirection(&input, 1, 0xffffffff);
	unsigned int key = key_to_integer();

	while (1) {
		button_data = XGpio_DiscreteRead(&input, 1);

		if (button_data == 0b0000) {

		} else if (button_data == 0b0001) {
			xil_printf("button 0\n");
			scan_files("0:/");
		} else if (button_data == 0b0010) {
			//xil_printf("\nbutton 1\n");
			const char * key = generate_key();
			unsigned long int test = 1;
			for (int i = 0; i < 4; ++i) {
				test = key[i];
				xil_printf("%02X", key[i]);
			}
			xil_printf("		%llu		%s\n", test, key);

		} else if (button_data == 0b0100) {
			xil_printf("button 0\n");
			mount_drive();
			xil_printf(cipher_text());
			unmount_drive();
		} else if(button_data == 0b1000){
			//unsigned_integer_to_array(3256358995);
			//3256358995
		}

		else {
			xil_printf("%X\n", button_data);
		}
	}

	xil_printf("---- default -----\n");/**
	 data_in1 = Xil_In32(XPAR_LBLOCK_WRAPPER_0_S00_AXI_BASEADDR);
	 data_in2 = Xil_In32(XPAR_LBLOCK_WRAPPER_0_S00_AXI_BASEADDR+4);
	 data_key1 = Xil_In32(XPAR_LBLOCK_WRAPPER_0_S00_AXI_BASEADDR+8);
	 data_key2 = Xil_In32(XPAR_LBLOCK_WRAPPER_0_S00_AXI_BASEADDR+12);
	 data_key3 = Xil_In32(XPAR_LBLOCK_WRAPPER_0_S00_AXI_BASEADDR+16);
	 xil_printf("%08X",data_in1);
	 xil_printf("%08X data in\n",data_in2);
	 xil_printf("%08X",data_key1);
	 xil_printf("%08X",data_key2);
	 xil_printf("%08X key in\n",data_key3);
	 **/
	data_out1 = Xil_In32(XPAR_LBLOCK_WRAPPER_0_S00_AXI_BASEADDR + 20);
	data_out2 = Xil_In32(XPAR_LBLOCK_WRAPPER_0_S00_AXI_BASEADDR + 24);
	xil_printf("%08X", data_out1);
	xil_printf("%08X defualt text\n ", data_out2);

	xil_printf("---- non zero blok -----\n");
	xil_printf("%08X		%d\n", key, key);
	Xil_Out32(XPAR_LBLOCK_WRAPPER_0_S00_AXI_BASEADDR, key);
	Xil_Out32(XPAR_LBLOCK_WRAPPER_0_S00_AXI_BASEADDR + 4, 0x89ABCDEF);
	Xil_Out32(XPAR_LBLOCK_WRAPPER_0_S00_AXI_BASEADDR + 8, 0x01234567);
	Xil_Out32(XPAR_LBLOCK_WRAPPER_0_S00_AXI_BASEADDR + 12, 0x89ABCDEF);
	Xil_Out32(XPAR_LBLOCK_WRAPPER_0_S00_AXI_BASEADDR + 16, 0xFEDC0000);

	data_in1 = Xil_In32(XPAR_LBLOCK_WRAPPER_0_S00_AXI_BASEADDR);
	data_in2 = Xil_In32(XPAR_LBLOCK_WRAPPER_0_S00_AXI_BASEADDR + 4);
	data_key1 = Xil_In32(XPAR_LBLOCK_WRAPPER_0_S00_AXI_BASEADDR + 8);
	data_key2 = Xil_In32(XPAR_LBLOCK_WRAPPER_0_S00_AXI_BASEADDR + 12);
	data_key3 = Xil_In32(XPAR_LBLOCK_WRAPPER_0_S00_AXI_BASEADDR + 16);
	xil_printf("%08X", data_in1);
	xil_printf("%08X data in\n", data_in2);
	xil_printf("%08X", data_key1);
	xil_printf("%08X", data_key2);
	xil_printf("%08X key in\n", data_key3);

	data_out1 = Xil_In32(XPAR_LBLOCK_WRAPPER_0_S00_AXI_BASEADDR + 20);
	data_out2 = Xil_In32(XPAR_LBLOCK_WRAPPER_0_S00_AXI_BASEADDR + 24);
	xil_printf("%08X", data_out1);
	xil_printf("%08X cipher text ", data_out2);
	xil_printf("\n4B7179D8EBEE0C26\n");
	//4b 71 79 d8 eb ee 0c 26

	xil_printf("---- zero blok -----\n");
	Xil_Out32(XPAR_LBLOCK_WRAPPER_0_S00_AXI_BASEADDR, 0x00000000);
	Xil_Out32(XPAR_LBLOCK_WRAPPER_0_S00_AXI_BASEADDR + 4, 0x00000000);
	Xil_Out32(XPAR_LBLOCK_WRAPPER_0_S00_AXI_BASEADDR + 8, 0x00000000);
	Xil_Out32(XPAR_LBLOCK_WRAPPER_0_S00_AXI_BASEADDR + 12, 0x00000000);
	Xil_Out32(XPAR_LBLOCK_WRAPPER_0_S00_AXI_BASEADDR + 16, 0x00000000);

	data_in1 = Xil_In32(XPAR_LBLOCK_WRAPPER_0_S00_AXI_BASEADDR);
	data_in2 = Xil_In32(XPAR_LBLOCK_WRAPPER_0_S00_AXI_BASEADDR + 4);
	data_key1 = Xil_In32(XPAR_LBLOCK_WRAPPER_0_S00_AXI_BASEADDR + 8);
	data_key2 = Xil_In32(XPAR_LBLOCK_WRAPPER_0_S00_AXI_BASEADDR + 12);
	data_key3 = Xil_In32(XPAR_LBLOCK_WRAPPER_0_S00_AXI_BASEADDR + 16);
	xil_printf("%08X", data_in1);
	xil_printf("%08X data in\n", data_in2);
	xil_printf("%08X", data_key1);
	xil_printf("%08X", data_key2);
	xil_printf("%08X key in\n", data_key3);

	data_out1 = Xil_In32(XPAR_LBLOCK_WRAPPER_0_S00_AXI_BASEADDR + 20);
	data_out2 = Xil_In32(XPAR_LBLOCK_WRAPPER_0_S00_AXI_BASEADDR + 24);
	xil_printf("%08X", data_out1);
	xil_printf("%08X cipher text ", data_out2);
	xil_printf("\nC218185308E75BCD\n");

	xil_printf("---- non zero blok -----\n");
	Xil_Out32(XPAR_LBLOCK_WRAPPER_0_S00_AXI_BASEADDR, 0x01234567);
	Xil_Out32(XPAR_LBLOCK_WRAPPER_0_S00_AXI_BASEADDR + 4, 0x89ABCDEF);
	Xil_Out32(XPAR_LBLOCK_WRAPPER_0_S00_AXI_BASEADDR + 8, 0x01234567);
	Xil_Out32(XPAR_LBLOCK_WRAPPER_0_S00_AXI_BASEADDR + 12, 0x89ABCDEF);
	Xil_Out32(XPAR_LBLOCK_WRAPPER_0_S00_AXI_BASEADDR + 16, 0xFEDC0000);

	data_out1 = Xil_In32(XPAR_LBLOCK_WRAPPER_0_S00_AXI_BASEADDR + 20);
	data_out2 = Xil_In32(XPAR_LBLOCK_WRAPPER_0_S00_AXI_BASEADDR + 24);

	data_out1 = Xil_In32(XPAR_LBLOCK_WRAPPER_0_S00_AXI_BASEADDR + 20);
	data_out2 = Xil_In32(XPAR_LBLOCK_WRAPPER_0_S00_AXI_BASEADDR + 24);
	xil_printf("%08X", data_out1);
	xil_printf("%08X cipher text ", data_out2);
	xil_printf("\n4B7179D8EBEE0C26\n");
	data_out1 = Xil_In32(XPAR_LBLOCK_WRAPPER_0_S00_AXI_BASEADDR + 20);
	data_out2 = Xil_In32(XPAR_LBLOCK_WRAPPER_0_S00_AXI_BASEADDR + 24);
	xil_printf("%08X", data_out1);
	xil_printf("%08X cipher text ", data_out2);
	xil_printf("\n4B7179D8EBEE0C26\n");

	xil_printf("---- zero blok -----\n");
	Xil_Out32(XPAR_LBLOCK_WRAPPER_0_S00_AXI_BASEADDR, 0x00000000);
	Xil_Out32(XPAR_LBLOCK_WRAPPER_0_S00_AXI_BASEADDR + 4, 0x00000000);
	Xil_Out32(XPAR_LBLOCK_WRAPPER_0_S00_AXI_BASEADDR + 8, 0x00000000);
	Xil_Out32(XPAR_LBLOCK_WRAPPER_0_S00_AXI_BASEADDR + 12, 0x00000000);
	Xil_Out32(XPAR_LBLOCK_WRAPPER_0_S00_AXI_BASEADDR + 16, 0x00000000);

	data_out1 = Xil_In32(XPAR_LBLOCK_WRAPPER_0_S00_AXI_BASEADDR + 20);
	data_out2 = Xil_In32(XPAR_LBLOCK_WRAPPER_0_S00_AXI_BASEADDR + 24);

	data_out1 = Xil_In32(XPAR_LBLOCK_WRAPPER_0_S00_AXI_BASEADDR + 20);
	data_out2 = Xil_In32(XPAR_LBLOCK_WRAPPER_0_S00_AXI_BASEADDR + 24);
	xil_printf("%08X", data_out1);
	xil_printf("%08X cipher text ", data_out2);
	xil_printf("\nC218185308E75BCD\n");

	data_out1 = Xil_In32(XPAR_LBLOCK_WRAPPER_0_S00_AXI_BASEADDR + 20);
	data_out2 = Xil_In32(XPAR_LBLOCK_WRAPPER_0_S00_AXI_BASEADDR + 24);
	xil_printf("%08X", data_out1);
	xil_printf("%08X cipher text ", data_out2);
	xil_printf("\nC218185308E75BCD\n");

	//XPAR_LBLOCK_WRAPPER_0_S00_AXI_BASEADDR 0x43C00000

	return 0;
}