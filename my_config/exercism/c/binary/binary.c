#include "binary.h"
#include "math.h"


int convert(const char *input){
  int result = 0;
  for (const char *c= input;*c!='\0';c++) {
    if(*c!='0' && *c!='1'){
      return INVALID; 
    }
    result = result * 2 + (*c == '0' ? 0:1); 
  }
  return result;
}
