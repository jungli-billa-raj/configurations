const std = @import("std");
const mem = std.mem;

pub fn abbreviate(allocator: mem.Allocator, words: []const u8) mem.Allocator.Error![]u8 {
    var list = try std.ArrayList(u8).initCapacity(allocator, words.len);
    defer list.deinit(allocator);
    // try list.append(allocator, std.ascii.toUpper(words[0]));
    try list.append(allocator, std.ascii.toUpper(words[0]));
    for (words, 0..)  |c, i| {
        if (!std.ascii.isAlphabetic(c) and c!='\'' and i+1<words.len){
            if (std.ascii.isAlphabetic(words[i+1])) {
            const char = std.ascii.toUpper(words[i+1]);
            try list.append(allocator, char);
            }
        }
        // const formatted_string = std.fmt.allocPrint(allocator, "{s}", .list.items);
        // defer allocator.free(formatted_string);
    }
    return try list.toOwnedSlice(allocator);
}
