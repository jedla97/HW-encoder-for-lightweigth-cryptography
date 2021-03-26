#include "sdcard_operations.h"

/************************** Variable Definitions *****************************/
/* File object */
static FIL fil2;
static FATFS fatfs;
/*
 * To test logical drive 0, FileName should be "0:/<File name>" or
 * "<file_name>". For logical drive 1, FileName should be "1:/<file_name>"
 */
static char FileName[32] = "Testing.bin";
static char *SD_File;
static char TextName[32] = "FileName.txt";
static char *SD_Text_File;

#ifdef __ICCARM__
#pragma data_alignment = 32
u8 DestinationAddress[10*1024];
#pragma data_alignment = 4
u8 data_read1[SIZE_OF_READ];
#pragma data_alignment = 4
u8 data_read2[SIZE_OF_READ];
#pragma data_alignment = 4
u8 data_encrypted1[SIZE_OF_READ];
#pragma data_alignment = 4
u8 data_encrypted2[SIZE_OF_READ];
#pragma data_alignment = 32
u8 SourceAddress[10*1024];
#else
u8 DestinationAddress[10 * 1024] __attribute__ ((aligned(32)));
u8 SourceAddress[10 * 1024] __attribute__ ((aligned(32)));
u8 DestAddr[SIZE_OF_READ] __attribute__ ((aligned(4)));

u8 data_read1[SIZE_OF_READ] __attribute__ ((aligned(4)));
u8 data_read2[SIZE_OF_READ] __attribute__ ((aligned(4)));
u8 data_encrypted[SIZE_OF_READ + SIZE_OF_READ] __attribute__ ((aligned(4)));
#endif

#define TEST 7
static FIL key_file;
static FIL fil;

int cipher_text_init(void) {
	int Status;
	xil_printf("SD Polled File System Example Test \r\n");

	Status = FfsSdPolledExample();
	if (Status != XST_SUCCESS) {
		xil_printf("SD Polled File System Example Test failed \r\n");
		return XST_FAILURE;
	}

	xil_printf("Successfully ran SD Polled File System Example Test test \r\n");

	return XST_SUCCESS;

}

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
	Res = f_mount(&fatfs, PATH, 0);
	if (Res != FR_OK) {
		print("mount");
		return XST_FAILURE;
	}
	return XST_SUCCESS;
}

int unmount_drive() {
	Res = f_unmount(PATH);
	if (Res != FR_OK) {
		return XST_FAILURE;
	}
	return XST_SUCCESS;
}

unsigned int ascii_to_integer(u8 * ascii) {
	int i = 0;
	unsigned int string_to_integer = 0;
	for (i = 0; i < SIZE_OF_READ; i++) {
		string_to_integer = (string_to_integer << 8) | ascii[i];
	}
	return string_to_integer;
}
//, u32 second_four_bytes
void unsigned_integer_to_array(u32 first_four_bytes,
		u32 second_four_bytes) {
	//unsigned char first_string[5];
	//char * second_string = malloc(5 * sizeof(short int*));
	//sprintf(first_string, "%lu", first_four_bytes);
	//second_string = (char *) second_four_bytes;
	//sprintf(first_string, "%lX", first_four_bytes);
	//sprintf(second_string, "%s", second_four_bites);
	/**
	 for (int i = 0; i < SIZE_OF_READ; ++i) {
	 data_encrypted1[i] = first_string[i];
	 data_encrypted2[i] = second_string[i];
	 }
	 **/

	data_encrypted[0] = (first_four_bytes >> 24) & 0xff;
	data_encrypted[1] = (first_four_bytes >> 16) & 0xff;
	data_encrypted[2] = (first_four_bytes >> 8) & 0xff;
	data_encrypted[3] = (first_four_bytes) & 0xff;
	data_encrypted[4] = (second_four_bytes >> 24) & 0xff;
	data_encrypted[5] = (second_four_bytes >> 16) & 0xff;
	data_encrypted[6] = (second_four_bytes >> 8) & 0xff;
	data_encrypted[7] = (second_four_bytes) & 0xff;
	//xil_printf("\n%s\n", first_string);
	//return first_string;
	//free(second_string);
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
	Res = f_read(&key_file, (void*) DestAddr, SIZE_OF_READ, &NumBytesRead);
	if (Res) {
		return XST_FAILURE;
	}
	// rewrite ascii string to int
	key = ascii_to_integer(DestAddr);
	//init array
	DestAddr[0] = 0;
	DestAddr[1] = 0;
	DestAddr[2] = 0;
	DestAddr[3] = 0;
	// write to fpga on register address of key
	Xil_Out32(XPAR_LBLOCK_WRAPPER_0_S00_AXI_BASEADDR + 8, key);

	Res = f_lseek(&key_file, 4);
	if (Res) {
		return XST_FAILURE;
	}
	Res = f_read(&key_file, (void*) DestAddr, SIZE_OF_READ, &NumBytesRead);
	if (Res) {
		return XST_FAILURE;
	}
	key = ascii_to_integer(DestAddr);
	DestAddr[0] = 0;
	DestAddr[1] = 0;
	DestAddr[2] = 0;
	DestAddr[3] = 0;
	Xil_Out32(XPAR_LBLOCK_WRAPPER_0_S00_AXI_BASEADDR + 12, key);

	Res = f_lseek(&key_file, 8);
	if (Res) {
		return XST_FAILURE;
	}
	Res = f_read(&key_file, (void*) DestAddr, SIZE_OF_READ - 2, &NumBytesRead);
	if (Res) {
		return XST_FAILURE;
	}
	key = ascii_to_integer(DestAddr);
	DestAddr[0] = 0;
	DestAddr[1] = 0;
	DestAddr[2] = 0;
	DestAddr[3] = 0;
	Xil_Out32(XPAR_LBLOCK_WRAPPER_0_S00_AXI_BASEADDR + 16, key);

	u32 data_key1 = Xil_In32(XPAR_LBLOCK_WRAPPER_0_S00_AXI_BASEADDR + 8);
	u32 data_key2 = Xil_In32(XPAR_LBLOCK_WRAPPER_0_S00_AXI_BASEADDR + 12);
	u32 data_key3 = Xil_In32(XPAR_LBLOCK_WRAPPER_0_S00_AXI_BASEADDR + 16);
	xil_printf("%08X", data_key1);
	xil_printf("%08X", data_key2);
	xil_printf("%08X key in\n", data_key3);

	Res = f_close(&key_file);
	if (Res) {
		print("close");
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
	u32 data_in_read1;
	u32 data_in_read2;
	u32 data_out1;
	u32 data_out2;
	u32 data_key1;
	u32 data_key2;
	u32 data_key3;
	char * data_writer1;
	char * data_writer2;

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

	for (i = 0; i <= f_size(&fil); i = i + (SIZE_OF_READ * 2)) {
		// look up for pointer on input file
		Res = f_lseek(&fil, i);
		if (Res) {
			print("seek");
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
			print("seek");
			return XST_FAILURE;
		}
		Res = f_read(&fil, (void*) data_read2, SIZE_OF_READ, &NumBytesRead);
		if (Res) {
			return XST_FAILURE;
		}
		data_in1 = ascii_to_integer(data_read1);
		data_in2 = ascii_to_integer(data_read2);
		Xil_Out32(XPAR_LBLOCK_WRAPPER_0_S00_AXI_BASEADDR, data_in1);
		Xil_Out32(XPAR_LBLOCK_WRAPPER_0_S00_AXI_BASEADDR + 4, data_in2);

		data_out1 = Xil_In32(XPAR_LBLOCK_WRAPPER_0_S00_AXI_BASEADDR + 20);
		data_out2 = Xil_In32(XPAR_LBLOCK_WRAPPER_0_S00_AXI_BASEADDR + 24);

		xil_printf("%08X", data_out1);
		xil_printf("%08X data out\n", data_out2);
		xil_printf("%u\n", data_out1);

		unsigned_integer_to_array(data_out1, data_out2);

		Res = f_lseek(&fil2, i);
		if (Res) {
			print("seek");
			return XST_FAILURE;
		}

		Res = f_write(&fil2, (void*) data_encrypted, SIZE_OF_READ + SIZE_OF_READ, &NumBytesWritten);
		if (Res) {
			print("write");
			return XST_FAILURE;
		}
		/**
		Res = f_lseek(&fil2, i + 4);
		if (Res) {
			print("seek");
			return XST_FAILURE;
		}

		Res = f_write(&fil2, (void*) data_out2, SIZE_OF_READ, &NumBytesWritten);
		if (Res) {
			print("write");
			return XST_FAILURE;
		}
**/
	}

//------ end of encryption --------
	Res = f_close(&fil);
	if (Res) {
		print("close");
		return XST_FAILURE;
	}

	Res = f_close(&fil2);
	if (Res) {
		print("close");
		return XST_FAILURE;
	}

	return XST_SUCCESS;
}

int FfsSdPolledExample(void) {
	FRESULT Res;
	UINT NumBytesRead;
	UINT NumBytesWritten;
	u32 BuffCnt;
	u32 FileSize = (1 * 1024);

	/*
	 * To test logical drive 0, Path should be "0:/"
	 * For logical drive 1, Path should be "1:/"
	 */

	for (BuffCnt = 0; BuffCnt < FileSize; BuffCnt++) {
		SourceAddress[BuffCnt] = TEST + BuffCnt;
	}

	/*
	 * Register volume work area, initialize device
	 */
	Res = f_mount(&fatfs, PATH, 0);
	if (Res != FR_OK) {
		print("mount");
		return XST_FAILURE;
	}

	/*
	 * Open file with required permissions.
	 * Here - Creating new file with read/write permissions. .
	 * To open file with write permissions, file system should not
	 * be in Read Only mode.
	 */
	SD_File = (char *) FileName;
	SD_Text_File = (char *) TextName;

// f_open(pointer to object(FIL), pointer to file name, open type)
	Res = f_open(&fil, SD_File, FA_OPEN_APPEND | FA_WRITE | FA_READ);
	if (Res) {
		print("open");
		return XST_FAILURE;
	}

	Res = f_open(&fil2, SD_Text_File, FA_CREATE_ALWAYS | FA_WRITE | FA_READ);
	if (Res) {
		print("open");
		return XST_FAILURE;
	}

	/*
	 * Pointer to beginning of file .
	 */
	Res = f_lseek(&fil, 0);
	if (Res) {
		print("seek");
		return XST_FAILURE;
	}

	Res = f_lseek(&fil2, 0);
	if (Res) {
		print("seek");
		return XST_FAILURE;
	}

	for (int i = 0; i < f_size(&fil); i = i + SIZE_OF_READ) {
		Res = f_lseek(&fil, i);
		if (Res) {
			print("seek");
			return XST_FAILURE;
		}

		Res = f_lseek(&fil2, i);
		if (Res) {
			print("seek");
			return XST_FAILURE;
		}

		Res = f_read(&fil, (void*) DestAddr, SIZE_OF_READ, &NumBytesRead);

		if (Res) {
			print("read");
			return XST_FAILURE;
		}

		print(DestAddr);
		print("\n");

		Res = f_write(&fil2, DestAddr, SIZE_OF_READ, &NumBytesWritten);
		if (Res) {
			print("write");
			return XST_FAILURE;
		}
	}

	/*
	 * Close file.
	 */
	Res = f_close(&fil);
	if (Res) {
		print("close");
		return XST_FAILURE;
	}

	Res = f_close(&fil2);
	if (Res) {
		print("close");
		return XST_FAILURE;
	}

//Res = scan_files(Path);

	return XST_SUCCESS;
}
