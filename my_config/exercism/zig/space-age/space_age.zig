//
// | Planet  | Orbital period in Earth Years |
// | ------- | ----------------------------- |
// | Mercury | 0.2408467                     |
// | Venus   | 0.61519726                    |
// | Earth   | 1.0                           |
// | Mars    | 1.8808158                     |
// | Jupiter | 11.862615                     |
// | Saturn  | 29.447498                     |
// | Uranus  | 84.016846                     |
// | Neptune | 164.79132                     |

pub const Planet = enum {
    mercury,
    venus,
    earth,
    mars,
    jupiter,
    saturn,
    uranus,
    neptune,
    pub fn age(self: Planet, seconds: usize) f64 {
        const e_s: f64 = 31_557_600;
        return switch (self) {
            .mercury => @as(f64, @floatFromInt(seconds)) / (e_s * 0.2408467),
            .venus => @as(f64, @floatFromInt(seconds)) / (e_s * 0.61519726),
            .earth => @as(f64, @floatFromInt(seconds)) / e_s,
            .mars => @as(f64, @floatFromInt(seconds)) / (e_s * 1.8808158),
            .jupiter => @as(f64, @floatFromInt(seconds)) / (e_s * 11.862615),
            .saturn => @as(f64, @floatFromInt(seconds)) / (e_s * 29.447498),
            .uranus => @as(f64, @floatFromInt(seconds)) / (e_s * 84.016846),
            .neptune => @as(f64, @floatFromInt(seconds)) / (e_s * 164.79132),
        };
    }
};
