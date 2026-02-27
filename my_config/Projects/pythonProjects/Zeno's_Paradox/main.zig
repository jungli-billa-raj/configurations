const std = @import("std");

pub fn main() void {
    var start: f128 = 1.0;
    var sum: f128 = 1.0;

    std.debug.print("{d}\n", .{sum});

    var i: usize = 0;
    while (i < 200) : (i += 1) {
        start /= 2.0;
        sum += start;

        std.debug.print("{d}\n", .{sum});

        if (sum == 2.0) {
            std.debug.print("Reached exactly 2 at iteration {}\n", .{i});
            break;
        }
    }
}

