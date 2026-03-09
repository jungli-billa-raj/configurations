const std = @import("std");

pub fn isArmstrongNumber(num: u128) bool {
   var length: u32 = 0; 
   // finding the length
   var dno = num ; 
   while(dno>0){
       length+=1;
       dno/=10;
   }
   // finding the armstrong sum 
   dno = num;
   // arm_sum has to be u128 because digit will be u128 because dno is num which is u128
   var arm_sum:u128 = 0;
   while(dno>0){
       const digit:u128 = dno%10;
       arm_sum+= std.math.pow(u128, digit, length);
       dno/=10;
   }
   return arm_sum==num;
}
