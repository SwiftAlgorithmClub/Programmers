import Foundation

struct DjikstraElement: Comparable {
    let distance: Int
    let vertex: Int

    static func <(_ lhs: DjikstraElement, _ rhs: DjikstraElement)->Bool {
        return lhs.distance < rhs.distance
    }
}

extension Array where Element == DjikstraElement {
    mutating func binaryInsert(_ element: Element) {
        var left = 0
        var right = count

        while left<right {
            let mid = (left+right)/2

            if self[mid] > element {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }

        self.insert(element, at: left)
    }
}

func solution(_ N:Int, _ road:[[Int]], _ k:Int) -> Int {

    var graph: [[Int]] = Array(repeating: Array(repeating: 123456789, count: N), count: N)
    var dist = Array(repeating: 123456789, count: N)
    var heap:[DjikstraElement] = []

    for r in road {
        if graph[r[0]-1][r[1]-1]>=r[2] {
            graph[r[0]-1][r[1]-1] = r[2]
            graph[r[1]-1][r[0]-1] = r[2]
        }
    }

    for i in 0..<N {
        heap.append(DjikstraElement(distance: 123456789, vertex: i))
    }

    dist[0] = 0
    heap[0] = DjikstraElement(distance: 0, vertex: 0)

    while !heap.isEmpty {
        let v = heap.removeLast()

        if v.distance<=dist[v.vertex] {
            for i in 0..<N {
                let temp =  dist[v.vertex]+graph[v.vertex][i]

                if dist[i]> temp {
                    dist[i] = temp
                    heap.binaryInsert(DjikstraElement(distance: temp, vertex: i))
                }
            }
        }
    }

    return dist.filter { $0 <= k }.count
}
