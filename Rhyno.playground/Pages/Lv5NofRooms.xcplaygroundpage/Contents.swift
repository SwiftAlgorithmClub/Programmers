import Foundation

struct Vertex: Hashable, Comparable {
    let x: Int
    let y: Int

    static func <(lhs: Vertex, rhs: Vertex) -> Bool {
        if lhs.x != rhs.x {
            return lhs.x < rhs.x
        }

        return lhs.y<rhs.y
    }
}

struct Edge: Hashable {
    let start: Vertex
    let end: Vertex
}

func move(_ v: Vertex, direction: Int) -> Vertex {
    let dx: [Int] = [0,1,1,1,0,-1,-1,-1]
    let dy: [Int] = [-1,-1,0,1,1,1,0,-1]

    return Vertex(x: v.x + dx[direction], y: v.y + dy[direction])
}

func solution(_ arrows:[Int]) -> Int {
    var startPoint = Vertex(x: 0, y: 0)

    var v: Set<Vertex> = Set()
    var e: Set<Edge> = Set()

    v.insert(startPoint)

    for a in arrows {
        for _ in 0..<2 { // 두 edge가 대각선으로 겹칠 때 겹치는 부분에 vertex가 없게 되는데, 이를 체크하기 위해 도형의 크기를 두배로 늘린다.


            let next = move(startPoint, direction: a)

            v.insert(next)

            if startPoint > next {
                e.insert(Edge(start: startPoint, end: next))
            } else {
                e.insert(Edge(start: next, end: startPoint))
            }

            startPoint = next
        }
    }


    return 1 - v.count + e.count
}

solution([6, 6, 6, 4, 4, 4, 2, 2, 2, 0, 0, 0, 6, 6, 6, 3, 3, 3])
