pub const DnaError = error{EmptyDnaStrands, UnequalDnaStrands};
pub fn compute(first: []const u8, second: []const u8) DnaError!usize {
    if (first.len==0 or second.len==0) return DnaError.EmptyDnaStrands;
   if (first.len != second.len) return DnaError.UnequalDnaStrands; 

   var hd:usize =0; //hamming distance
   for (first, 0..) |letter, index| {
    if (letter != second[index]) hd+=1;
   }
   return hd;
}
