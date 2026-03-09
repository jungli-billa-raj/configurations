pub const ColorBand = enum(usize) { 
black,
brown,
red,
orange,
yellow,
green,
blue,
violet,
grey,
white,
};

pub fn colorCode(x:ColorBand) usize {
    return @intFromEnum(x);
}
const all_codes = [_]ColorBand{
    ColorBand.black,
    ColorBand.brown,
    ColorBand.red,
    ColorBand.orange,
    ColorBand.yellow,
    ColorBand.green,
    ColorBand.blue,
    ColorBand.violet,
    ColorBand.grey,
    ColorBand.white,
};

pub fn colors() []const ColorBand {
    return &all_codes;
}
