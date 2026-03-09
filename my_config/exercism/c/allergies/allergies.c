#include "allergies.h"


bool is_allergic_to(allergen_t allergen_name,int allergen_score){
  int diff =allergen_score-(int)allergen_name; 
 if((diff)>=0 &&(diff%allergen_name!=0)){
    return true;
  } else {
    return false;
  }
}


allergen_list_t get_allergens(int allergen_count){
 return (allergen_list_t){allergen_count, {false}};
}
