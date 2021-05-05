#include "uart_cipher.h"
unsigned int xor_8bits(u8 *character, unsigned int init_vector1) {
	unsigned int help_vector = left_rotate(init_vector1, 8);
	help_vector = help_vector ^ character[0];
	return help_vector;
}

unsigned int left_rotate(unsigned int n, unsigned int d) {

	return (n << d) | (n >> (INT_BITS - d));
}
unsigned int right_rotate(unsigned int n, unsigned int d) {

	return (n >> d) | (n << (INT_BITS - d));
}

unsigned int replaceByte(unsigned int input_vector, unsigned int position, unsigned int replacment) {
	unsigned int shift = 8 * position;
	unsigned int value = replacment << shift;
	unsigned int mask = 0xff << shift;

	return (~mask & input_vector) | value;
}

u8 * load_vector(u8 *vector, unsigned int init_vector1,
		unsigned int init_vector2) {
	vector[0] = (init_vector1 >> 24) & 0xff;
	vector[1] = (init_vector1 >> 16) & 0xff;
	vector[2] = (init_vector1 >> 8) & 0xff;
	vector[3] = (init_vector1) & 0xff;
	vector[4] = (init_vector2 >> 24) & 0xff;
	vector[5] = (init_vector2 >> 16) & 0xff;
	vector[6] = (init_vector2 >> 8) & 0xff;
	vector[7] = (init_vector2) & 0xff;
	return vector;
}
u8 * load_key(u8 *key, unsigned int key1, unsigned int key2, unsigned int key3) {
	key[0] = (key1 >> 24) & 0xff;
	key[1] = (key1 >> 16) & 0xff;
	key[2] = (key1 >> 8) & 0xff;
	key[3] = (key1) & 0xff;
	key[4] = (key2 >> 24) & 0xff;
	key[5] = (key2 >> 16) & 0xff;
	key[6] = (key2 >> 8) & 0xff;
	key[7] = (key2) & 0xff;
	key[8] = (key3 >> 24) & 0xff;
	key[9] = (key3 >> 16) & 0xff;
	return key;
}