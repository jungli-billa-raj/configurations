const std = @import("std");

pub fn main() void {
    const chars = [_]u8{ 'a', 'c', 'g', 't' };
    std.debug.print("{any}", .{chars});
}
