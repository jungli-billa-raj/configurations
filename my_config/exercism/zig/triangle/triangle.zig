// Errors
pub const TriangleError = error{
    Invalid
};

pub const Triangle = struct {
    a :f64,
    b :f64,
    c :f64,

    pub fn init(a: f64, b: f64, c: f64) TriangleError!Triangle {
        if (a+b<=c or b+c<=a or c+a<=b) return TriangleError.Invalid;
        return Triangle{
            .a = a,
            .b = b, 
            .c = c,
        };
    }

    pub fn isEquilateral(self: Triangle) bool {
        if (self.a==self.b and self.b==self.c){
            return true;
        } else{
            return false;
        } 
    }

    pub fn isIsosceles(self: Triangle) bool {
        if (self.a==self.b or self.b==self.c or self.c==self.a){
            return true;
        }else {
            return false;
        }
    }

    pub fn isScalene(self: Triangle) bool {
        if (!isEquilateral(self) and !isIsosceles(self)){
            return true;
        } else {
            return false;
        }
    }
};
