pub fn squareRoot(radicand: usize) usize {
    // Newton's formula
    var x:f32 = 10;

    while (true) {
        const rounded = @round(x*x);
        const rounded_usize:usize = @intFromFloat(rounded);
        if (rounded_usize == radicand){
            break;
        }
        x = 0.5*(x + @as(f32, @floatFromInt(radicand))/x);
    }

    return @as(usize, @intFromFloat(x)); 
    // const x:usize = 1;
    // for (0..radicand) |i| {
    //     if (i*i == radicand) return i;
    // }
    // return x;
}
