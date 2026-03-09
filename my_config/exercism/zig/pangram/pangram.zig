const std = @import("std");
pub fn isPangram(str: []const u8) bool {
    var collection: u32 = 0;

    for (str) |c| {
        if (std.ascii.isAlphabetic(c)) {
            const upper_c: u5 = @intCast(std.ascii.toUpper(c) - 'A'); // 0-25
            const temp: u32 = @as(u32, 1) << upper_c;
            collection |= temp;
        }
    }
    if (collection == (1 << 26) - 1) {
        return true;
    }
    return false;
}
