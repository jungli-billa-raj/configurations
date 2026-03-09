pub const Coordinate = struct {
    x:f32,
    y:f32,

    pub fn init(x_coord: f32, y_coord: f32) Coordinate {
        return .{ .x=x_coord, .y=y_coord };
    }
    pub fn score(self: Coordinate) usize {
       const rad:f32 = self.x*self.x + self.y*self.y;
       if (rad<=1){
           return 10;
       }else if (rad<=25) {
           return 5;
       }else if (rad<=100) {
           return 1;
       }else {
           return 0;
       }
    }
};
