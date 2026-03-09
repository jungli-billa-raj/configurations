const std = @import("std");

pub fn main() !void {
    const name = "Raj";
    for(name) |c| {
        std.debug.print("{c}\n", .{c});
    }
}
