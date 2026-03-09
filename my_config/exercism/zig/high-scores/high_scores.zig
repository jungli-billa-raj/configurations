const std = @import("std");

pub const HighScores = struct {
    scores: []const i32,
    top3: [3]i32,
    top3_len: usize,

    pub fn init(scores: []const i32) HighScores {
       var hs = HighScores{
           .scores = scores,
           .top3 = .{ -1, -1, -1 },
           .top3_len = @min(3, scores.len),
       };

       // finding top 3
       for (scores) |v| {
            if (v>hs.top3[0]){
                hs.top3[2] = hs.top3[1];
                hs.top3[1] = hs.top3[0];
                hs.top3[0] = v; 
            } else if (v>hs.top3[1]){
                hs.top3[2] = hs.top3[1];
                hs.top3[1] = v;
            } else if (v>hs.top3[2]){
                hs.top3[2] = v;
            }
       }

       return hs;

    }

    pub fn latest(self: *const HighScores) ?i32 {
        return self.scores[self.scores.len-1];
    }

    pub fn personalBest(self: *const HighScores) ?i32 {
        var best:i32 = 0;
        for (self.scores) |v|{
            if (v>best) best =v;
        }
        return best;
    }

    pub fn personalTopThree(self: *const HighScores) []const i32 {
        return self.top3[0..self.top3_len];
    }
};

