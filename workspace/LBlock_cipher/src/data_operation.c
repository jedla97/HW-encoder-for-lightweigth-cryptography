#include "data_operation.h"

unsigned int ascii_to_integer(u8 * ascii) {
	int i = 0;
	unsigned int string_to_integer = 0;
	for (i = 0; i < SIZE_OF_READ; i++) {
		string_to_integer = (string_to_integer << 8) | ascii[i];
	}
	return string_to_integer;
}

unsigned char * unsigned_integer_to_char_array(u32 first_four_bytes, unsigned char * arr) {
	arr[0] = (first_four_bytes >> 24) & 0xff;
	arr[1] = (first_four_bytes >> 16) & 0xff;
	arr[2] = (first_four_bytes >> 8) & 0xff;
	arr[3] = (first_four_bytes) & 0xff;
	return arr;
}
