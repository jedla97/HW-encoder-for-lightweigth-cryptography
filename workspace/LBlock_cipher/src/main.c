#include "generation.h"
#include "xparameters.h"
#include "xil_io.h"
#include "xil_types.h"
#include "xil_assert.h"
#include "xgpiops_hw.h"
#include "xgpio.h"
#include "sdcard_operations.h"
int main() {

	int status = 0;

	XGpio input, output;
	int button_data = 0;
	xil_printf("start\n");
	// Initialize gpio for buttons
	XGpio_Initialize(&input, XPAR_AXI_GPIO_0_DEVICE_ID);
	// Initialize gpio for RGB LED
	XGpio_Initialize(&output, XPAR_AXI_GPIO_2_DEVICE_ID);
	// set default values
	XGpio_SetDataDirection(&output, 1, 0xffffffff);
	XGpio_SetDataDirection(&input, 1, 0xffffffff);

	// waiting for pressing button in infinite cycle
	while (1) {
		// read what was pressed
		button_data = XGpio_DiscreteRead(&input, 1);

		// when nothing is pressed
		if (button_data == 0b0000) {

		}
		// button BTN0
		else if (button_data == 0b0001) {
			xil_printf("button 0\n");
			//generate_inicialization_vector(1);
			//0xe0 red left

			XGpio_DiscreteWrite(&output, 1, 0xff);

		}
		// button BTN1
		else if (button_data == 0b0010) {
			xil_printf("\nbutton 1\n");
			XGpio_DiscreteWrite(&output, 1, 0x0a);
			/**
			 const char * key = generate_key();
			 unsigned long int test = 1;
			 for (int i = 0; i < 4; ++i) {
			 test = key[i];
			 xil_printf("%02X", key[i]);
			 }
			 xil_printf("		%llu		%s\n", test, key);
			 **/
		}
		// sd card cipher with generated key ;; button BTN2
		else if (button_data == 0b0100) {
			xil_printf("button 2\n");
			XGpio_DiscreteWrite(&output, 1, 0x00);
			status = mount_drive();
			status = save_and_generate_key();
			status = cipher_text_CFB_32bit();
			status = unmount_drive();
			if (status == 0) {
				//green
				XGpio_DiscreteWrite(&output, 1, 0xd0);
			} else {
				//red
				XGpio_DiscreteWrite(&output, 1, 0xe0);
			}

		}
		// sd card cipher with predefined key ;; button BTN3
		else if (button_data == 0b1000) {
			XGpio_DiscreteWrite(&output, 1, 0x00);
			xil_printf("button 3\n");
			status = mount_drive();
			status = cipher_text_CFB_32bit();
			status = unmount_drive();
			if (status == 0) {
				//green
				XGpio_DiscreteWrite(&output, 1, 0xd0);
			} else {
				//red
				XGpio_DiscreteWrite(&output, 1, 0xe0);
			}

		} else {
			xil_printf("%X\n", button_data);
		}
	}

	//XPAR_LBLOCK_WRAPPER_0_S00_AXI_BASEADDR 0x43C00000

	return 0;
}
