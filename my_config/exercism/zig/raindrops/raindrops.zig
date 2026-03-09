// If a given number:
//
// - is divisible by 3, add "Pling" to the result.
// - is divisible by 5, add "Plang" to the result.
// - is divisible by 7, add "Plong" to the result.
// - **is not** divisible by 3, 5, or 7, the result should be the number as a string.
//
const std = @import("std");
pub fn convert(buffer: []u8, n: u32) []const u8 {
    var i: usize = 0;

    if (n % 3 == 0) {
        const written = std.fmt.bufPrint(buffer[i..], "Pling", .{}) catch return buffer[0..i];
        i += written.len;
    }
    if (n % 5 == 0) {
        const written = std.fmt.bufPrint(buffer[i..], "Plang", .{}) catch return buffer[0..i];
        i += written.len;
    }
    if (n % 7 == 0) {
        const written = std.fmt.bufPrint(buffer[i..], "Plong", .{}) catch return buffer[0..i];
        i += written.len;
    }
    if (i == 0) {
        const written = std.fmt.bufPrint(buffer, "{}", .{n}) catch return buffer[0..i];
        return written;
    }
    return buffer[0..i];
}
