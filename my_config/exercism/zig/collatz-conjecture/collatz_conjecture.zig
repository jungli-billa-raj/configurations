// Please implement the `ComputationError.IllegalArgument` error.
pub const ComputationError = error{IllegalArgument};

pub fn steps(number: usize) anyerror!usize {
    if(number<=0) return ComputationError.IllegalArgument;
   var counter:usize = 0;
   var no:usize = number;
   while(no!=1){
       if(no%2==0){
           no/=2;
       }else {
           no=no*3+1;
       }
       counter+=1;
   }
   return counter;
}
