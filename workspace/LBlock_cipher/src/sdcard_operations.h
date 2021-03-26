#include "xparameters.h"
#include "xsdps.h"		/* SD device driver */
#include "xil_printf.h"
#include "ff.h"
#include "ffconf.h"
#include "xil_cache.h"
#include "xplatform_info.h"
#include "strings.h"
#include "stdlib.h"
#include "stdio.h"

#define f_unmount(path) f_mount(0, path, 0)
#define SIZE_OF_READ 4
#define FILE_TO_CIPHER "INPUT"
#define PATH  "0:/"
#define KEY_FILE "key.txt"
#define ENCRYPTED_FILE "output.bin"

FRESULT Res;

int FfsSdPolledExample();
char * scan_files (char* path); // return name of file to cipher
int cipher_text();
unsigned int ascii_to_integer(u8 * ascii);
void unsigned_integer_to_array(u32 first_four_bytes, u32 second_four_bytes);
int write_key();
int unmount_drive();
int mount_drive();
