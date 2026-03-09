const std = @import("std");
const mem = std.mem;

// - `G` -> `C`
// - `C` -> `G`
// - `T` -> `A`
// - `A` -> `U`

pub fn toRna(allocator: mem.Allocator, dna: []const u8) mem.Allocator.Error![]const u8 {
    const x = try allocator.alloc(u8, dna.len);
    for (dna, 0..) |protein, index| {
        switch (protein) {
            'A' => x[index] = 'U',
            'T' => x[index] = 'A',
            'C' => x[index] = 'G',
            'G' => x[index] = 'C',
            else => return mem.Allocator.Error.OutOfMemory,
        }
    }
    return x;
}
