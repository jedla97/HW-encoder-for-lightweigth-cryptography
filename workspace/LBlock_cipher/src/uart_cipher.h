#include "xparameters.h"
#include "xil_printf.h"
#include "xil_cache.h"
#include "xplatform_info.h"
#include "strings.h"
#include "stdlib.h"
#include "stdio.h"
#include "generation.h"

#define INT_BITS 32

unsigned int xor_8bits(u8 *character, unsigned int init_vector1);
unsigned int left_rotate(unsigned int vector, unsigned  int shift);
u8 * load_vector(u8 *vector, unsigned int init_vector1, unsigned int init_vector2);
u8 * load_key(u8 *key, unsigned int key1, unsigned int key2, unsigned int key3);