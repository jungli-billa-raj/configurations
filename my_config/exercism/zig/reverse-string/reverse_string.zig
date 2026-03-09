/// Writes a reversed copy of `s` to `buffer`.
pub fn reverse(buffer: []u8, s: []const u8) []u8 {
    var reverse_index: usize = undefined;
    for (s, 0..) |c, index| {
        reverse_index = s.len - 1 - index;
        buffer[reverse_index] = c;
    }
    return buffer[0..s.len]; // Why is this part important?
}
