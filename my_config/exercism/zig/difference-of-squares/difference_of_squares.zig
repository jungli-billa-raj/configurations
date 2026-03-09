pub fn squareOfSum(number: usize) usize {
   return block:{
    var sum:usize = 0;
    var i:usize = 0;
    while (i<=number) : (i+=1) {
        sum+=i;
    }
    sum = sum*sum;
    break :block sum;
   }; 
}

pub fn sumOfSquares(number: usize) usize {
    return block:{
    var sum:usize = 0;
    var i:usize = 0;
    while (i<=number) : (i+=1) {
        sum+=i*i;
    }
    break :block sum;
   };
}

pub fn differenceOfSquares(number: usize) usize {
    return squareOfSum(number) - sumOfSquares(number);
}
