#include "leap.h"

bool leap_year(int year){
  if (year%100==0) {
    // check divisibliyt by 400
    if (year%400==0){
      return true;
    } else {
      return false;
    }
  } else {
    // check divisibliy by 4
    if (year%4==0){
      return true;
    } else {
      return false;
    }
  } 
}  
