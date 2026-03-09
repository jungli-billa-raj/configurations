#include <stdio.h>

int main(void)
{
  // let's try to find the length of a string. 
  const char *name = "Aditya";
  int length = 0;
  for (int i=0; name[i]!='\0'; i++){
   length++; 
  }

  // Let's try to palindrome the name

  // Initialize a char array of length same as name. 
  char reversed[length];
  int j=0;
  for (int i=length-1; i>=0; i--){
    reversed[j]=name[i];
    j++;
  }
  // reversed[j]='\0';
  printf("Reversed is %s\n", reversed);

  return 0;
}
