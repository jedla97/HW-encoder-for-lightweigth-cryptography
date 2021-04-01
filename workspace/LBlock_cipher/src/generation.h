#include "xparameters.h"
#include "stdlib.h"
#include "xil_io.h"
#include "xil_types.h"
#include "xil_assert.h"
#include "xgpiops_hw.h"
#include "xgpio.h"

#define LENGHT_OF_KEY 4
#define charset "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXUZ[]^_`{|}~0123456789!@#$%&*()+/-?:<>,.;'"

const char* generate_key();
unsigned int key_to_integer();
unsigned int generate_inicialization_vector();

