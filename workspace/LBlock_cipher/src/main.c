#include "generation.h"
#include "xparameters.h"
#include "xil_io.h"
#include "xil_types.h"
#include "xil_assert.h"
#include "xgpiops_hw.h"
#include "xgpio.h"
#include "sdcard_operations.h"
#include "xtime_l.h"
#include "xuartps.h"
#include "uart_cipher.h"

int main() {
	XTime tStart, tEnd;

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
			//xil_printf("button 0\n");
			XUartPs_Config *Config;
			XUartPs Uart_PS;
			u8 *buffer;
			u8 key[10];
			u8 vector[8];
			u32 Status;
			u32 recBites = 0;
			u32 sendBites = 0;
			u32 totalrec = 0;
			u32 totalsend = 0;
			int end_status = 0;


			unsigned int init_vector1 = generate_random_bits();
			unsigned int init_vector2 = generate_random_bits();

			unsigned int key1 = generate_random_bits();
			unsigned int key2 = generate_random_bits();
			unsigned int key3 = generate_random_bits();

			load_vector(vector, init_vector1, init_vector2);
			load_key(key, key1, key2, key3);

			button_data = 0;

			buffer = malloc(sizeof(u8));

			// UART 0 initialization

			Config = XUartPs_LookupConfig(XPAR_XUARTPS_0_DEVICE_ID);
			if (NULL == Config) {
				return XST_FAILURE;
			}
			Status = XUartPs_CfgInitialize(&Uart_PS, Config,
					Config->BaseAddress);
			if (Status != XST_SUCCESS) {
				return XST_FAILURE;
			}
			Status = XUartPs_SetBaudRate(&Uart_PS, 115200);
			if (Status != XST_SUCCESS) {
				return XST_FAILURE;
			}
			sleep(1);
			while (end_status == 0) {
				while (totalrec < 1 && end_status == 0) {
					recBites = XUartPs_Recv(&Uart_PS, (u8*) &buffer[totalrec],
							1);
					totalrec += recBites;
					button_data = XGpio_DiscreteRead(&input, 1);
					if (button_data == 0b0001) {
						end_status = 1;
					}

				}
				totalrec = 0;

				// return key and vector
				if (end_status == 1) {
					while (totalsend < 10) {
						sendBites = XUartPs_Send(&Uart_PS,
								(u8*) &key[totalsend], 1);
						totalsend += sendBites;
					}
					totalsend = 0;
					while (totalsend < 8) {
						sendBites = XUartPs_Send(&Uart_PS,
								(u8*) &vector[totalsend], 1);
						totalsend += sendBites;
					}
					break;
				}
				//cipher and  return ciphered byte
				else {

					Xil_Out32(XPAR_LBLOCK_WRAPPER_S00_AXI_BASEADDR,
							init_vector1);
					Xil_Out32(XPAR_LBLOCK_WRAPPER_S00_AXI_BASEADDR + 4,
							init_vector2);
					init_vector1 = Xil_In32(
					XPAR_LBLOCK_WRAPPER_S00_AXI_BASEADDR + 20);
					init_vector2 = Xil_In32(
					XPAR_LBLOCK_WRAPPER_S00_AXI_BASEADDR + 24);

					init_vector1 = xor_8bits(buffer, init_vector1);
					buffer[0] = (init_vector1) & 0xff;
					init_vector1 = (~0xff & init_vector1)
							| ((init_vector2 >> 24) & 0xff);
					init_vector2 = left_rotate(init_vector2, 8);
					init_vector2 = (~0xff & init_vector2) | buffer[0];

					while (totalsend < 1) {
						sendBites = XUartPs_Send(&Uart_PS,
								(u8*) &buffer[totalsend], 1);
						totalsend += sendBites;
					}
					totalsend = 0;
				}

			}
			free(buffer);
			sleep(1);

		}
		// button BTN1
		else if (button_data == 0b0010) {
			XGpio_DiscreteWrite(&output, 1, 0x00);
			xil_printf("button 1\n");
			XTime_GetTime(&tStart);
			status = mount_drive();
			if (status == 0) {
				status = cipher_text_OFB();
				if (status == 0) {
					status = unmount_drive();
				} else {
					unmount_drive();
				}

			}
			if (status == 0) {
				//green
				XGpio_DiscreteWrite(&output, 1, 0x10);
			} else {
				//red
				XGpio_DiscreteWrite(&output, 1, 0x20);
			}
			XTime_GetTime(&tEnd);
			printf("Output took %llu clock cycles.\n", 2 * (tEnd - tStart));
			printf("Output took %.2f us.\n",
					1.0 * (tEnd - tStart) / (COUNTS_PER_SECOND / 1000000));

		}

// sd card cipher with generated key ;; button BTN2
		else if (button_data == 0b0100) {
			xil_printf("button 2\n");
			XGpio_DiscreteWrite(&output, 1, 0x00);
			status = mount_drive();
			if (status == 0) {
				status = save_and_generate_key();
				if (status == 0) {
					status = cipher_text_CFB_32bit();
					if (status == 0) {
						status = unmount_drive();
					} else {
						unmount_drive();
					}
				} else {
					unmount_drive();
				}

			}
			if (status == 0) {
				//green
				XGpio_DiscreteWrite(&output, 1, 0x10);
			} else {
				//red
				XGpio_DiscreteWrite(&output, 1, 0x20);
			}

		}
// sd card cipher with predefined key ;; button BTN3
		else if (button_data == 0b1000) {
			XGpio_DiscreteWrite(&output, 1, 0x00);
			xil_printf("button 3\n");
			XTime_GetTime(&tStart);
			status = mount_drive();
			if (status == 0) {
				status = cipher_text_CFB_32bit();
				if (status == 0) {
					status = unmount_drive();
				} else {
					unmount_drive();
				}

			}
			if (status == 0) {
				//green
				XGpio_DiscreteWrite(&output, 1, 0x10);
			} else {
				//red
				XGpio_DiscreteWrite(&output, 1, 0x20);
			}
			XTime_GetTime(&tEnd);
			printf("Output took %llu clock cycles.\n", 2 * (tEnd - tStart));
			printf("Output took %.2f us.\n",
					1.0 * (tEnd - tStart) / (COUNTS_PER_SECOND / 1000000));
		} else {
			xil_printf("%X\n", button_data);
		}
	}

//XPAR_LBLOCK_WRAPPER_0_S00_AXI_BASEADDR 0x43C00000

	return 0;
}
