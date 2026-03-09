pub fn eggCount(number: usize) usize {
   var count:usize = 0;
   var no = number;
   while(no>0){
       count+=no%2;
       no/=2;
   }
   return count;
}
