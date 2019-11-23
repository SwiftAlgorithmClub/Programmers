import Foundation

extension Array where Element: Comparable {
    mutating func binaryInsert(_ element: Element) {
        if isEmpty {
            self.append(element)
        }

        var begin = 0
        var end = count - 1

        while begin <= end {
            let mid = (begin + end)/2

            if self[mid] < element {
                end = mid - 1
            } else {
                begin = mid + 1
            }
        }

        self.insert(element, at: begin)
    }
}

struct Point: Hashable {
    let x: Int
    let y: Int
}

struct Edge: Hashable, Comparable {
    let begin: Point
    let end: Point
    let cost: Int

    static func < (lhs: Edge, rhs: Edge) -> Bool {
        return lhs.cost < rhs.cost
    }
}

func solution(_ land:[[Int]], _ height:Int) -> Int {
    var result = 0

    var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: land[0].count), count: land.count)

    var pq: [Edge] = []

    visited[0][0] = true

    pq.binaryInsert(Edge(begin: Point(x: 0, y: 0), end: Point(x: 0, y: 1), cost: abs(land[0][0] - land[1][0])))
    pq.binaryInsert(Edge(begin: Point(x: 0, y: 0), end: Point(x: 1, y: 0), cost: abs(land[0][0] - land[0][1])))

    let dx: [Int] = [1,0,-1,0]
    let dy: [Int] = [0,1,0,-1]

    while !pq.isEmpty {
        let nextEdge = pq.removeLast()
        let x = nextEdge.end.x
        let y = nextEdge.end.y

        if visited[y][x] {
            continue
        }

        visited[y][x] = true

        if nextEdge.cost > height {
            result += nextEdge.cost
        }

        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]

            if nx<0||nx>=visited[0].count||ny<0||ny>=visited.count {
                continue
            }

            if visited[ny][nx] {
                continue
            }

            let edge = Edge(begin: nextEdge.end, end: Point(x: nx, y: ny), cost: abs(land[y][x] - land[ny][nx]))
            pq.binaryInsert(edge)

        }

    }
    return result
}

