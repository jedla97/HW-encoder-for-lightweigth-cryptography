#include "generation.h"

const char* generate_key(int lenght) {
	char * ret = "";
	if (LENGHT_OF_KEY) {
		for (int n = 0; n < LENGHT_OF_KEY; n++) {
			int key = rand() % (int) (sizeof(charset) - 1);
			ret[n] = charset[key];
		}
		ret[LENGHT_OF_KEY+1] = '\0';
	}
	return ret;
}

unsigned int key_to_integer(int lenght){
	const char * key = generate_key(lenght);
	int i = 0;
	unsigned int string_to_integer = 0;
	for(i=0;i<lenght;i++){
		string_to_integer =(string_to_integer<<8) | key[i];
	}
	return string_to_integer;
}

unsigned int generate_inicialization_vector(int lenght){

}