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
#include "data_operation.h"
#include "generation.h"
#include "xtime_l.h"

#define f_unmount(path) f_mount(0, path, 0)
#define SIZE_OF_READ 4
#define FILE_TO_CIPHER "INPUT"
#define PATH  "0:/"
#define KEY_FILE "key.txt"
#define ENCRYPTED_FILE "output.bin"
#define INIT_VECTOR "invector.bin"


// mount sd card
int mount_drive();
// unmount sd card
int unmount_drive();

char * scan_files (char* path); // return name of file to cipher

//electronic code book cipher mode -- only for testing
int cipher_text();

//Output feedback cipher mode -- fully working
int cipher_text_OFB();
// xor 2 ciphered vectors with plaintext and call unsigned_integer_to_array
void xor_data_with_init_vector(unsigned int vector1, unsigned int vector2, unsigned int plaintext1, unsigned int plaintext2);

// Cipher feedback mode -- fully working at the moment is only one used
int cipher_text_CFB_32bit();
// call unsigned_integer_to_char_array and save returned char* to data_encrypted_CFB
void unsigned_integer_to_array_CFB(u32 first_four_bytes);
// return unsigned int of xor between two unsigned values
unsigned int xor_plaintext_with_init_vector(unsigned int vector, unsigned int plaintext);

// generate random key from LFSR and save it to the key.txt file
FRESULT save_and_generate_key();
// write key to PL part in key register for LBlock
int write_key();

// save generated initial vector to invector.bin file
FRESULT save_init_vector(u32 first_vector, u32 second_vector);

// call unsigned_integer_to_char_array and save returned char* to data_encrypted
void unsigned_integer_to_array(u32 first_four_bytes, u32 second_four_bytes);
// null array of data_encrypted
void null_encrypted_data();







