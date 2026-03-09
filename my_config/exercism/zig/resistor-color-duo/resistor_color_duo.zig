pub const ColorBand = enum(usize){
 black   ,
 brown   ,
 red      ,
 orange  ,
 yellow  ,
 green   ,
 blue    ,
 violet  ,
 grey    ,
 white   ,
};
pub fn colorCode(colors: [2]ColorBand) usize {
    // wrong, because unlike C, Zig does not auto promote numbers type. 
    // Here, the enum will be u4 because it has around 10 elements but *10 will result in integer overflow.
    // Let's try changing the enum definition to usize
    const sum:usize = @intFromEnum(colors[0])*10 + @intFromEnum(colors[1]);
    return sum;
}
