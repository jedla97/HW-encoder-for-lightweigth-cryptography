#include "xparameters.h"
#include "stdlib.h"
#include "xil_io.h"
#include "xil_types.h"
#include "xil_assert.h"

#define LENGHT_OF_KEY 4
#define charset "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXUZ[]^_`{|}~0123456789!@#$%&*()+/-?:<>,.;'"

const char* generate_key();
unsigned int key_to_integer();

