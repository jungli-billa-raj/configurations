// Given a string representing a DNA sequence, count how many of each nucleotide is present.
// If the string contains characters that aren't A, C, G, or T then it is invalid and you should signal an error.

const std = @import("std");
pub const NucleotideError = error{Invalid};

pub const Counts = struct {
    a: u32,
    c: u32,
    g: u32,
    t: u32,
};
// { 97, 99, 103, 116 }
pub fn countNucleotides(s: []const u8) NucleotideError!Counts {
    var count: Counts = Counts{
        .a = 0,
        .c = 0,
        .g = 0,
        .t = 0,
    };
    for (s) |c| {
        switch (c) {
            'A' => count.a += 1,
            'C' => count.c += 1,
            'G' => count.g += 1,
            'T' => count.t += 1,
            else => return NucleotideError.Invalid,
        }
    }
    return count;
}
