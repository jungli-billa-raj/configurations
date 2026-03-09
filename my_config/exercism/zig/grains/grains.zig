pub const ChessboardError = error{ IndexOutOfBounds };
const std = @import("std");
const pow = std.math.pow;
pub fn square(index: usize) ChessboardError!u64 {
    if (index<1 or index>64){
        return ChessboardError.IndexOutOfBounds;
    }
    return pow(u64, 2, index-1);
}

pub fn total() u64 {
    var sum:u64 = 0;
   for (1..65) |i|{
    sum += square(i) catch 0;
   } 
   return sum;
}



