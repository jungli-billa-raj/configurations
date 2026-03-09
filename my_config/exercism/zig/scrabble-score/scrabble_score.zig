const ascii = @import("std").ascii;

const scores = init: {
    var table: [26]u8 = .{0} ** 26;

    const set = struct {
        fn set_value(val: u8, letters: []const u8, array: *[26]u8) void {
            for (letters) |c| {
                array[c - 'A'] = val;
            }
        }
    };
    set.set_value(1, "AEIOULNRST", &table);
    set.set_value(2, "DG", &table);
    set.set_value(3, "BCMP", &table);
    set.set_value(4, "FHVWY", &table);
    set.set_value(5, "K", &table);
    set.set_value(8, "JX", &table);
    set.set_value(10, "QZ", &table);

    break :init table;
};

pub fn score(s: []const u8) u32 {
    var sum: u32 = 0;
    for (s) |c| {
        const uc = ascii.toUpper(c);
        sum += scores[uc - 'A'];
    }
    return sum;
}
// | Letter                       | Value |
// | ---------------------------- | ----- |
// | A, E, I, O, U, L, N, R, S, T | 1     |
// | D, G                         | 2     |
// | B, C, M, P                   | 3     |
// | F, H, V, W, Y                | 4     |
// | K                            | 5     |
// | J, X                         | 8     |
// | Q, Z                         | 10    |
//
