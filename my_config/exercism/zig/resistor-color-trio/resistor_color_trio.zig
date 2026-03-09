const std = @import("std");
const mem = std.mem;

pub const ColorBand = enum {
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


pub fn colorCode(color:ColorBand) u8 {
    return switch (color) {
        .black => 0,
        .brown => 1, 
        .red => 2,  
        .orange => 3,
        .yellow => 4,
        .green => 5, 
        .blue => 6, 
        .violet => 7,
        .grey => 8,
        .white => 9, 
    };
}

const prefix = [_][]const u8{ " ohms", " kiloohms", " megaohms", " gigaohms" };

pub fn label(allocator: mem.Allocator, colors: []const ColorBand) mem.Allocator.Error![]u8 {


}
