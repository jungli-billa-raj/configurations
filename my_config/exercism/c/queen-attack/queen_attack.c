#include "queen_attack.h"

attack_status_t can_attack(position_t queen_1, position_t queen_2){
  uint8_t r1 = queen_1.row;
  uint8_t c1 = queen_1.column;
  uint8_t r2 = queen_2.row;
  uint8_t c2 = queen_2.column;
  if((r1>7 || r2>7 || c1>7 || c2>7) || (r1==r2 && c1==c2)){
    return INVALID_POSITION; 
  }
  // Checking for row and column match. 
  if(r1==r2 || c1==c2){
    return CAN_ATTACK;
  }
  // Checking for diagonale match.
  // I figured out that the absolute value of difference in diagonal pieces's positions are identical. 
  if(abs_diff(r1,r2)==abs_diff(c1,c2)){
    return CAN_ATTACK;
  }
  return CAN_NOT_ATTACK;
}

uint8_t abs_diff(uint8_t a,uint8_t b){
  if(a>b){
    return a-b;
  }
  return b-a;
}



