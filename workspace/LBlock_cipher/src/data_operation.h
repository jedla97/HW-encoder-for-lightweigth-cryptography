#include "xparameters.h"
#include "xil_printf.h"
#include "xil_cache.h"
#include "xplatform_info.h"
#include "strings.h"
#include "stdlib.h"
#include "stdio.h"

#define SIZE_OF_READ 4

unsigned int ascii_to_integer(u8 * ascii);
unsigned char * unsigned_integer_to_char_array(u32 first_four_bytes, unsigned char * arr);
