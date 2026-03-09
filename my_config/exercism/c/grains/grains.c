#include "grains.h"

// uint64_t square(uint8_t index);
// uint64_t total(void);

uint64_t power(uint8_t base, uint8_t index){
  if (index==0) {
    return 1;
  }
  uint64_t result = 1;
  for(uint8_t i=1;i<=index;i++){
    result=result*base;
  }
  return result;
}

uint64_t square(uint8_t index){
  if (index==0){
    return 0;
  }
  return power(2, index-1);
}


uint64_t total(void){
  uint64_t result;
  for (int i=1;i<=64;i++){
    result+=square(i);
  }
  return result;
}
