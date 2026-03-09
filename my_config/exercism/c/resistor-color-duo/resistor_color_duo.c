#include "resistor_color_duo.h"



uint16_t color_code(resistor_band_t rb[]){
  // Today I learnt a new thing. 
  // In C, the length of array is not carried by the array. 
  // so, doing this :
  // size_t length = sizeof(rb) / sizeof(rb[0]);
  // wouldn't work. Arrays don't contains '\0' at the end to signal termination. You'll read the whole RAM if you do this. 
  // Therefore, If a function needs the length of an array, the length must be passed in or fixed by convention. 
  // Here, I'm going to assume that the length is just 2. 
  uint16_t result = rb[0]*10+rb[1];
  return result;
}


