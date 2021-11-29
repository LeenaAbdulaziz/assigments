import UIKit

struct Point{
    var x:Double
    var y:Double
}

struct Line{
    var start:Point
    var end:Point
    
    func Length()->Double{
        let p1=pow(end.x-start.x, 2)
        
        let p2=pow(end.y-start.y, 2)
        let sqr=sqrt(p1+p2)
        
        return sqr
    }
}

struct Triangle {
    
    var points:[Point]
    
    func Area()->Double{
        
    let p1=points[0]
    let p2=points[1]
    let p3=points[2]
        
        // Ax(By - Cy) + Bx(Cy - Ay) + Cx(Ay - By)
        
        let a=(p1.x * (p2.y-p3.y)+p2.x * (p3.y-p1.y) + p3.x * (p2.y-p2.y))*0.5
        
        return a
    }
    
}

var len = Line(start: Point(x:1,y:2), end: Point(x:3,y:5))
print(len.Length())

var tri=Triangle(points: [Point(x: 1, y: 2),Point(x: 3, y: 3),Point(x: 6, y: 4)])
print(tri.Area())
