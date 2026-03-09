const std = @import("std");
const mem = std.mem;

pub fn transform(allocator: mem.Allocator, legacy: std.AutoHashMap(i5, []const u8)) mem.Allocator.Error!std.AutoHashMap(u8, i5) {
    // creating a new AutoHashMap for returning
    var map:std.AutoHashMap(u8, i5) = .init(allocator);

    var iterator = legacy.iterator();
    while (iterator.next()) |entry| {
        for (entry.value_ptr.*) |c| {
            try map.put(std.ascii.toLower(c), entry.key_ptr.*);
        }
    }

    return map;
}

// - 1 point: "A", "E", "I", "O", "U", "L", "N", "R", "S", "T",
// - "a" is worth 1 point.
