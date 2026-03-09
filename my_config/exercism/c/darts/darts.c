#include "darts.h"


uint8_t score(coordinate_t pos){
  float x = pos.x;
  float y = pos.y;
  float distance_sq = x*x+y*y; 
  if(distance_sq<=1){
    return 10; 
  } else if (distance_sq<=25) {
    return 5;
  } else if (distance_sq<=100){
    return 1; 
  } else{
    return 0;
  }
}




