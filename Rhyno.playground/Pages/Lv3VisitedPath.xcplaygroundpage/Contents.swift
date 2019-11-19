import Foundation

struct Point: Hashable {
    let x: Int
    let y: Int

    func move(to: Character) -> Point? {
        switch to {
        case Character("U"):
            guard self.y < 5 else {
                return nil
            }
            return Point(x: self.x, y: self.y+1)
        case Character("D"):
            guard self.y > -5 else {
                return nil
            }
            return Point(x: self.x, y: self.y-1)
        case Character("L"):
            guard x > -5 else {
                return nil
            }
            return Point(x: self.x-1, y: self.y)
        case Character("R"):
            guard x < 5 else {
                return nil
            }
            return Point(x: self.x+1, y: self.y)
        default:
            return nil
        }
    }
}

struct Path: Hashable {
    let start: Point
    let end: Point
}

func solution(_ dirs:String) -> Int {

    var current = Point(x: 0, y: 0)
    var paths: Set<Path> = Set()

    for d in dirs {
        if let next = current.move(to: d) {
            paths.insert(Path(start: current, end: next))
            paths.insert(Path(start: next, end: current))

            current = next
        }
    }

    return paths.count / 2
}
