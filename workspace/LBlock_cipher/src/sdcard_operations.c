#include "sdcard_operations.h"

/************************** Variable Definitions *****************************/
/* File object */
static FIL fil;
static FIL fil2;
static FIL fil3;
static FIL key_file;
static FATFS fatfs;
/*
 * To test logical drive 0, FileName should be "0:/<File name>" or
 * "<file_name>". For logical drive 1, FileName should be "1:/<file_name>"
 */

u8 key_writer[SIZE_OF_READ] __attribute__ ((aligned(4)));

u8 data_read1[SIZE_OF_READ] __attribute__ ((aligned(4)));
u8 data_read2[SIZE_OF_READ] __attribute__ ((aligned(4)));
u8 data_encrypted[SIZE_OF_READ + SIZE_OF_READ] __attribute__ ((aligned(8)));
u8 data_encrypted_CFB[SIZE_OF_READ] __attribute__ ((aligned(8)));
u8 init_vector[SIZE_OF_READ + SIZE_OF_READ] __attribute__ ((aligned(8)));
u8 key_random[SIZE_OF_READ + SIZE_OF_READ + 2] __attribute__ ((aligned(8)));

char * scan_files(char* path) {
	FRESULT res;
	DIR dir;
	static FILINFO fno;
	char * file_info;

	res = f_opendir(&dir, path); /* Open the directory */
	if (res == FR_OK) {
		for (;;) {
			res = f_readdir(&dir, &fno); /* Read a directory item */
			file_info = fno.fname;
			if (res != FR_OK || fno.fname[0] == 0)
				break; /* Break on error or end of dir */
			//xil_printf("%s/%s\n", path, file_info);
			if (strstr(file_info, FILE_TO_CIPHER) != NULL) {
				f_closedir(&dir);
				return file_info;
			}
		}
		f_closedir(&dir);
	}
	file_info = "0";
	return file_info;
}

int mount_drive() {
	FRESULT Res = FR_INT_ERR;
	Res = f_mount(&fatfs, PATH, 0);
	if (Res != FR_OK) {
		return XST_FAILURE;
	}
	return XST_SUCCESS;
}

int unmount_drive() {
	FRESULT Res;
	Res = f_unmount(PATH);
	if (Res != FR_OK) {
		return XST_FAILURE;
	}
	return XST_SUCCESS;
}

//, u32 second_four_bytes
FRESULT save_init_vector(u32 first_vector, u32 second_vector) {

	FRESULT Res;
	UINT NumBytesWritten;
	Res = f_open(&fil3, INIT_VECTOR, FA_CREATE_ALWAYS | FA_WRITE | FA_READ);
	if (Res) {
		return XST_FAILURE;
	}

	unsigned char vector_to_file1[4];
	unsigned char vector_to_file2[4];
	unsigned_integer_to_char_array(first_vector, vector_to_file1);
	unsigned_integer_to_char_array(second_vector, vector_to_file2);
	init_vector[0] = vector_to_file1[0];
	init_vector[1] = vector_to_file1[1];
	init_vector[2] = vector_to_file1[2];
	init_vector[3] = vector_to_file1[3];
	init_vector[4] = vector_to_file2[0];
	init_vector[5] = vector_to_file2[1];
	init_vector[6] = vector_to_file2[2];
	init_vector[7] = vector_to_file2[3];

	Res = f_lseek(&fil3, 0);
	if (Res) {
		return XST_FAILURE;
	}
	Res = f_write(&fil3, (void*) init_vector,
	SIZE_OF_READ + SIZE_OF_READ, &NumBytesWritten);
	if (Res) {
		return XST_FAILURE;
	}
	Res = f_close(&fil3);
	if (Res) {
		return XST_FAILURE;
	}

	return XST_SUCCESS;

}

void unsigned_integer_to_array(u32 first_four_bytes, u32 second_four_bytes) {
	unsigned char first[5];
	unsigned_integer_to_char_array(first_four_bytes, first);
	unsigned char second[5];
	unsigned_integer_to_char_array(second_four_bytes, second);
	null_encrypted_data();
	data_encrypted[0] = first[0];
	data_encrypted[1] = first[1];
	data_encrypted[2] = first[2];
	data_encrypted[3] = first[3];
	data_encrypted[4] = second[0];
	data_encrypted[5] = second[1];
	data_encrypted[6] = second[2];
	data_encrypted[7] = second[3];
}

void null_encrypted_data() {
	data_encrypted[0] = 0;
	data_encrypted[1] = 0;
	data_encrypted[2] = 0;
	data_encrypted[3] = 0;
	data_encrypted[4] = 0;
	data_encrypted[5] = 0;
	data_encrypted[6] = 0;
	data_encrypted[7] = 0;
}

FRESULT save_and_generate_key() {

	FRESULT Res;
	UINT NumBytesWritten;
	Res = f_open(&fil3, KEY_FILE, FA_CREATE_ALWAYS | FA_WRITE | FA_READ);
	if (Res) {
		return XST_FAILURE;
	}

	unsigned int key_part1 = generate_random_bits();
	unsigned int key_part2 = generate_random_bits();
	unsigned int key_part3 = generate_random_bits();

	unsigned char key_to_file1[4];
	unsigned char key_to_file2[4];
	unsigned char key_to_file3[4];
	unsigned_integer_to_char_array(key_part1, key_to_file1);
	unsigned_integer_to_char_array(key_part2, key_to_file2);
	unsigned_integer_to_char_array(key_part3, key_to_file3);
	key_random[0] = key_to_file1[0];
	key_random[1] = key_to_file1[1];
	key_random[2] = key_to_file1[2];
	key_random[3] = key_to_file1[3];
	key_random[4] = key_to_file2[0];
	key_random[5] = key_to_file2[1];
	key_random[6] = key_to_file2[2];
	key_random[7] = key_to_file2[3];
	key_random[8] = key_to_file3[0];
	key_random[9] = key_to_file3[1];

	Res = f_lseek(&fil3, 0);
	if (Res) {
		return XST_FAILURE;
	}
	Res = f_write(&fil3, (void*) key_random,
	SIZE_OF_READ + SIZE_OF_READ + 2, &NumBytesWritten);
	if (Res) {
		return XST_FAILURE;
	}
	Res = f_close(&fil3);
	if (Res) {
		return XST_FAILURE;
	}

	return XST_SUCCESS;

}

int write_key() {
	FRESULT Res;
	UINT NumBytesRead;
	unsigned int key = 0;
	Res = f_open(&key_file, KEY_FILE, FA_READ);
	if (Res) {
		return XST_FAILURE;
	}
	// pointer to start of key file
	Res = f_lseek(&key_file, 0);
	if (Res) {
		return XST_FAILURE;
	}
	// read first 4 bytes from key file
	Res = f_read(&key_file, (void*) key_writer, SIZE_OF_READ, &NumBytesRead);
	if (Res) {
		return XST_FAILURE;
	}
	// rewrite ascii string to int
	key = ascii_to_integer(key_writer);
	//init array
	key_writer[0] = 0;
	key_writer[1] = 0;
	key_writer[2] = 0;
	key_writer[3] = 0;
	// write to fpga on register address of key
	Xil_Out32(XPAR_LBLOCK_WRAPPER_S00_AXI_BASEADDR + 8, key);

	Res = f_lseek(&key_file, 4);
	if (Res) {
		return XST_FAILURE;
	}
	Res = f_read(&key_file, (void*) key_writer, SIZE_OF_READ, &NumBytesRead);
	if (Res) {
		return XST_FAILURE;
	}
	key = ascii_to_integer(key_writer);
	key_writer[0] = 0;
	key_writer[1] = 0;
	key_writer[2] = 0;
	key_writer[3] = 0;
	Xil_Out32(XPAR_LBLOCK_WRAPPER_S00_AXI_BASEADDR + 12, key);

	Res = f_lseek(&key_file, 8);
	if (Res) {
		return XST_FAILURE;
	}
	Res = f_read(&key_file, (void*) key_writer, SIZE_OF_READ - 2,
			&NumBytesRead);
	if (Res) {
		return XST_FAILURE;
	}
	key = ascii_to_integer(key_writer);
	key_writer[0] = 0;
	key_writer[1] = 0;
	key_writer[2] = 0;
	key_writer[3] = 0;
	Xil_Out32(XPAR_LBLOCK_WRAPPER_S00_AXI_BASEADDR + 16, key);

	Res = f_close(&key_file);
	if (Res) {
		return XST_FAILURE;
	}
	return XST_SUCCESS;
}

int cipher_text() {
	FRESULT Res;
	UINT NumBytesRead;
	UINT NumBytesWritten;
	unsigned int data_in1 = 0;
	unsigned int data_in2 = 0;
	u32 data_out1;
	u32 data_out2;

	int error = 0;
	static char * toEncrypt;
	int i;

	//------ start of reading key --------
	error = write_key();
	if (error == 1) {
		return XST_FAILURE;
	}
	//------ end of reading key --------

	//------ start of encryption --------
	// get file to encrypt
	toEncrypt = scan_files(PATH);

	//open file to encrypt with write access
	Res = f_open(&fil, toEncrypt, FA_READ);
	if (Res) {
		return XST_FAILURE;
	}
	// create binary file to write encrypted data
	Res = f_open(&fil2, ENCRYPTED_FILE, FA_CREATE_ALWAYS | FA_WRITE | FA_READ);
	if (Res) {
		return XST_FAILURE;
	}

	for (i = 0; i < f_size(&fil); i = i + (SIZE_OF_READ * 2)) {
		// look up for pointer on input file
		Res = f_lseek(&fil, i);
		if (Res) {
			return XST_FAILURE;
		}

		Res = f_read(&fil, (void*) data_read1, SIZE_OF_READ + SIZE_OF_READ,
				&NumBytesRead);
		if (Res) {
			return XST_FAILURE;
		}

		// look up for pointer on input file
		Res = f_lseek(&fil, i + 4);
		if (Res) {
			return XST_FAILURE;
		}
		Res = f_read(&fil, (void*) data_read2, SIZE_OF_READ, &NumBytesRead);
		if (Res) {
			return XST_FAILURE;
		}
		data_in1 = ascii_to_integer(data_read1);
		data_in2 = ascii_to_integer(data_read2);
		Xil_Out32(XPAR_LBLOCK_WRAPPER_S00_AXI_BASEADDR, data_in1);
		Xil_Out32(XPAR_LBLOCK_WRAPPER_S00_AXI_BASEADDR + 4, data_in2);

		data_out1 = Xil_In32(XPAR_LBLOCK_WRAPPER_S00_AXI_BASEADDR + 20);
		data_out2 = Xil_In32(XPAR_LBLOCK_WRAPPER_S00_AXI_BASEADDR + 24);
		data_out1 = Xil_In32(XPAR_LBLOCK_WRAPPER_S00_AXI_BASEADDR + 20);
		data_out2 = Xil_In32(XPAR_LBLOCK_WRAPPER_S00_AXI_BASEADDR + 24);

		unsigned_integer_to_array(data_out1, data_out2);

		Res = f_lseek(&fil2, i);
		if (Res) {
			return XST_FAILURE;
		}

		Res = f_write(&fil2, (void*) data_encrypted,
		SIZE_OF_READ + SIZE_OF_READ, &NumBytesWritten);
		if (Res) {
			return XST_FAILURE;
		}

	}
//------ end of encryption --------
	Res = f_close(&fil);
	if (Res) {
		return XST_FAILURE;
	}

	Res = f_close(&fil2);
	if (Res) {
		return XST_FAILURE;
	}

	return XST_SUCCESS;
}

int cipher_text_OFB() {
	XTime tStart, tEnd;
	FRESULT Res;
	UINT NumBytesRead;
	UINT NumBytesWritten;
	unsigned int plaintext1 = 0;
	unsigned int plaintext2 = 0;

	// vectors
	unsigned int init_vector1;
	unsigned int init_vector2;

	int error = 0;
	static char * toEncrypt;
	int i;

	//------ start of reading key --------
	error = write_key();
	if (error == 1) {
		return XST_FAILURE;
	}
	//------ end of reading key --------

	//------ start of encryption --------
	// get file to encrypt
	toEncrypt = scan_files(PATH);

	//open file to encrypt with write access
	Res = f_open(&fil, toEncrypt, FA_READ);
	if (Res) {
		return XST_FAILURE;
	}
	// create binary file to write encrypted data
	Res = f_open(&fil2, ENCRYPTED_FILE, FA_CREATE_ALWAYS | FA_WRITE | FA_READ);
	if (Res) {
		return XST_FAILURE;
	}

	//------ start of reading and writing IV (inicialization vector) --------
	init_vector1 = generate_random_bits();
	init_vector2 = generate_random_bits();

	Res = save_init_vector(init_vector1, init_vector2);
	if (Res) {
		return XST_FAILURE;
	}

	//------ end of reading and writing IV (inicialization vector) --------
	int size = f_size(&fil);
	int modsize = size % 8;
	for (i = 0; i < (size - modsize); i = i + (SIZE_OF_READ + SIZE_OF_READ)) {
		// look up for pointer on input file
		//XTime_GetTime(&tStart);
		Res = f_lseek(&fil, i);
		if (Res) {
			return XST_FAILURE;
		}

		Res = f_read(&fil, (void*) data_read1, SIZE_OF_READ + SIZE_OF_READ,
				&NumBytesRead);
		if (Res) {
			return XST_FAILURE;
		}

		// look up for pointer on input file
		Res = f_lseek(&fil, i + 4);
		if (Res) {
			return XST_FAILURE;
		}
		Res = f_read(&fil, (void*) data_read2, SIZE_OF_READ, &NumBytesRead);
		if (Res) {
			return XST_FAILURE;
		}
		//XTime_GetTime(&tEnd);
		//printf("Load took %.2f us.\n",
				//1.0 * (tEnd - tStart) / (COUNTS_PER_SECOND / 1000000));

		//XTime_GetTime(&tStart);
		// read and switch plaintext to integer
		plaintext1 = ascii_to_integer(data_read1);
		plaintext2 = ascii_to_integer(data_read2);

		Xil_Out32(XPAR_LBLOCK_WRAPPER_S00_AXI_BASEADDR, init_vector1);
		Xil_Out32(XPAR_LBLOCK_WRAPPER_S00_AXI_BASEADDR + 4, init_vector2);

		init_vector1 = Xil_In32(XPAR_LBLOCK_WRAPPER_S00_AXI_BASEADDR + 20);
		init_vector2 = Xil_In32(XPAR_LBLOCK_WRAPPER_S00_AXI_BASEADDR + 24);

		xor_data_with_init_vector(init_vector1, init_vector2, plaintext1,
				plaintext2);

		//XTime_GetTime(&tEnd);
		//printf("cipher took %.2f us.\n",
				//1.0 * (tEnd - tStart) / (COUNTS_PER_SECOND / 1000000));

		//XTime_GetTime(&tStart);
		Res = f_lseek(&fil2, i);
		if (Res) {
			return XST_FAILURE;
		}

		Res = f_write(&fil2, (void*) data_encrypted,
		SIZE_OF_READ + SIZE_OF_READ, &NumBytesWritten);
		if (Res) {
			return XST_FAILURE;
		}
		//XTime_GetTime(&tEnd);
		//printf("write took %.2f us.\n",
				//1.0 * (tEnd - tStart) / (COUNTS_PER_SECOND / 1000000));

	}

	if (size % 8 != 0) {
		Res = f_lseek(&fil, i);
		if (Res) {
			return XST_FAILURE;
		}

		Res = f_read(&fil, (void*) data_read1, SIZE_OF_READ + SIZE_OF_READ,
				&NumBytesRead);
		if (Res) {
			return XST_FAILURE;
		}

		// look up for pointer on input file
		Res = f_lseek(&fil, i + 4);
		if (Res) {
			return XST_FAILURE;
		}
		Res = f_read(&fil, (void*) data_read2, SIZE_OF_READ, &NumBytesRead);
		if (Res) {
			return XST_FAILURE;
		}

		// read and switch plaintext to integer
		plaintext1 = ascii_to_integer(data_read1);
		plaintext2 = ascii_to_integer(data_read2);

		Xil_Out32(XPAR_LBLOCK_WRAPPER_S00_AXI_BASEADDR, init_vector1);
		Xil_Out32(XPAR_LBLOCK_WRAPPER_S00_AXI_BASEADDR + 4, init_vector2);

		init_vector1 = Xil_In32(XPAR_LBLOCK_WRAPPER_S00_AXI_BASEADDR + 20);
		init_vector2 = Xil_In32(XPAR_LBLOCK_WRAPPER_S00_AXI_BASEADDR + 24);

		xor_data_with_init_vector(init_vector1, init_vector2, plaintext1,
				plaintext2);

		Res = f_lseek(&fil2, i);
		if (Res) {
			return XST_FAILURE;
		}

		Res = f_write(&fil2, (void*) data_encrypted, size % 8,
				&NumBytesWritten);
		if (Res) {
			return XST_FAILURE;
		}
	}

	//------ end of encryption --------
	Res = f_close(&fil);
	if (Res) {
		return XST_FAILURE;
	}

	Res = f_close(&fil2);
	if (Res) {
		return XST_FAILURE;
	}

	return XST_SUCCESS;
}

int cipher_text_CFB_32bit() {
	XTime tStart, tEnd;
	FRESULT Res;
	UINT NumBytesRead;
	UINT NumBytesWritten;
	unsigned int plaintext1 = 0;

	// vectors
	unsigned int init_vector1;
	unsigned int init_vector2;
	unsigned int help_init_vector;

	int error = 0;
	static char * toEncrypt;
	int i;

	//------ start of reading key --------
	error = write_key();
	if (error == 1) {
		return XST_FAILURE;
	}
	//------ end of reading key --------

	//------ start of encryption --------
	// get file to encrypt
	toEncrypt = scan_files(PATH);

	//open file to encrypt with write access
	Res = f_open(&fil, toEncrypt, FA_READ);
	if (Res) {
		return XST_FAILURE;
	}
	// create binary file to write encrypted data
	Res = f_open(&fil2, ENCRYPTED_FILE,
	FA_CREATE_ALWAYS | FA_WRITE | FA_READ);
	if (Res) {
		return XST_FAILURE;
	}

	//------ start of reading and writing IV (inicialization vector) --------
	init_vector1 = generate_random_bits();
	init_vector2 = generate_random_bits();

	Res = save_init_vector(init_vector1, init_vector2);
	if (Res) {
		return XST_FAILURE;
	}

	//------ end of reading and writing IV (inicialization vector) --------
	int size = f_size(&fil);
	for (i = 0; i < (size - (size % 4)); i = i + (SIZE_OF_READ)) {
		// look up for pointer on input file
		//XTime_GetTime(&tStart);
		Res = f_lseek(&fil, i);
		if (Res) {
			return XST_FAILURE;
		}

		Res = f_read(&fil, (void*) data_read1, SIZE_OF_READ, &NumBytesRead);
		if (Res) {
			return XST_FAILURE;
		}

		//XTime_GetTime(&tEnd);
		//printf("load took %.2f us.\n",
				//1.0 * (tEnd - tStart) / (COUNTS_PER_SECOND / 1000000));
		//XTime_GetTime(&tStart);
		// read and switch plaintext to integer
		plaintext1 = ascii_to_integer(data_read1);

		Xil_Out32(XPAR_LBLOCK_WRAPPER_S00_AXI_BASEADDR, init_vector1);
		Xil_Out32(XPAR_LBLOCK_WRAPPER_S00_AXI_BASEADDR + 4, init_vector2);

		init_vector1 = Xil_In32(XPAR_LBLOCK_WRAPPER_S00_AXI_BASEADDR + 20);
		init_vector2 = Xil_In32(XPAR_LBLOCK_WRAPPER_S00_AXI_BASEADDR + 24);

		help_init_vector = xor_plaintext_with_init_vector(init_vector1,
				plaintext1);
		init_vector1 = init_vector2;
		init_vector2 = help_init_vector;

		unsigned_integer_to_array_CFB(help_init_vector);

		//XTime_GetTime(&tEnd);
		//printf("cipher took %.2f us.\n",
				//1.0 * (tEnd - tStart) / (COUNTS_PER_SECOND / 1000000));
		//XTime_GetTime(&tStart);

		Res = f_lseek(&fil2, i);
		if (Res) {
			return XST_FAILURE;
		}

		Res = f_write(&fil2, (void*) data_encrypted_CFB,
		SIZE_OF_READ, &NumBytesWritten);
		if (Res) {
			return XST_FAILURE;
		}
		////XTime_GetTime(&tEnd);
			//	printf("write took %.2f us.\n",
				//		//1.0 * (tEnd - tStart) / (COUNTS_PER_SECOND / 1000000));

	}

	if (size % 4 != 0) {
		Res = f_lseek(&fil, i);
		if (Res) {
			return XST_FAILURE;
		}

		Res = f_read(&fil, (void*) data_read1, SIZE_OF_READ, &NumBytesRead);
		if (Res) {
			return XST_FAILURE;
		}

		plaintext1 = ascii_to_integer(data_read1);

		Xil_Out32(XPAR_LBLOCK_WRAPPER_S00_AXI_BASEADDR, init_vector1);
		Xil_Out32(XPAR_LBLOCK_WRAPPER_S00_AXI_BASEADDR + 4, init_vector2);

		init_vector1 = Xil_In32(XPAR_LBLOCK_WRAPPER_S00_AXI_BASEADDR + 20);
		init_vector2 = Xil_In32(XPAR_LBLOCK_WRAPPER_S00_AXI_BASEADDR + 24);

		help_init_vector = xor_plaintext_with_init_vector(init_vector1,
				plaintext1);

		unsigned_integer_to_array_CFB(help_init_vector);

		Res = f_lseek(&fil2, i);
		if (Res) {
			return XST_FAILURE;
		}

		Res = f_write(&fil2, (void*) data_encrypted_CFB, size % 4,
				&NumBytesWritten);
		if (Res) {
			return XST_FAILURE;
		}
	}

	//------ end of encryption --------
	Res = f_close(&fil);
	if (Res) {
		return XST_FAILURE;
	}

	Res = f_close(&fil2);
	if (Res) {
		return XST_FAILURE;
	}

	return Res;

}

void xor_data_with_init_vector(unsigned int vector1, unsigned int vector2,
		unsigned int plaintext1, unsigned int plaintext2) {
	unsigned int first_part = vector1 ^ plaintext1;
	unsigned int second_part = vector2 ^ plaintext2;
	unsigned_integer_to_array(first_part, second_part);
}

unsigned int xor_plaintext_with_init_vector(unsigned int vector,
		unsigned int plaintext) {
	return vector ^ plaintext;
}

void unsigned_integer_to_array_CFB(u32 first_four_bytes) {
	unsigned char first[5];
	unsigned_integer_to_char_array(first_four_bytes, first);
	data_encrypted_CFB[0] = first[0];
	data_encrypted_CFB[1] = first[1];
	data_encrypted_CFB[2] = first[2];
	data_encrypted_CFB[3] = first[3];
}
