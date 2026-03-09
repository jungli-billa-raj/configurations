const std = @import("std");
pub fn isIsogram(str: []const u8) bool {
    var c_db: u32 = 0; // character_database. I'm using this integer to maintain a record of seen alphabets
    for (str) |c| {
        if (std.ascii.isAlphabetic(c)) {
            // For bitwise shift, Zig forces you to use smaller(predictable) values on RHS, for example:
            // u64 << u6 , u32 << u5(used here) , u16<<u4, u8<<u3
            const idx: u5 = @intCast(std.ascii.toUpper(c) - 'A'); // to get id between 0-25
            const bit_id = @as(u32, 1) << idx;
            if ((c_db & bit_id) != 0) return false;
            c_db |= bit_id;
        }
    }
    return true;
}
