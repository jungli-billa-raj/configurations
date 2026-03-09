#include "resistor_color.h"


int color_code(resistor_band_t r){
  return r; 
}

 const resistor_band_t r[] = {
 BLACK,
 BROWN,
 RED ,
 ORANGE,
 YELLOW,
 GREEN,
 BLUE,
 VIOLET,
 GREY,
 WHITE,
};
const resistor_band_t *colors(void){

  return r;
}
