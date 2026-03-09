#include "hamming.h"
#include "stdbool.h"

#define ERROR_HAMMING_SCORE -1

int compute(const char *lhs, const char *rhs){
  bool reached_end = false;
  int hamming_score = 0;
  int counter = 0;
  while(!reached_end){
    if((lhs[counter]=='\0' && rhs[counter]!='\0')||(lhs[counter]!='\0' && rhs[counter]=='\0')){
      return ERROR_HAMMING_SCORE;
    }
    if(lhs[counter]=='\0' && rhs[counter]=='\0'){
      break;
    }
    if (lhs[counter]!=rhs[counter]){
      hamming_score++;
    } 
    counter++;
  }
  return hamming_score;
}
