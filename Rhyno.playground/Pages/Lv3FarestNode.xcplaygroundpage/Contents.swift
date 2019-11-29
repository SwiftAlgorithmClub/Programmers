import Foundation

func solution(_ n:Int, _ edge:[[Int]]) -> Int {
    var graph: [[Int]] = Array(repeating: [], count: n)
    var queue: [Int] = [0]
    var distance: [Int] = Array(repeating: Int.max, count: n)
    var currentDistance = 0

    for i in 0..<edge.count {
        graph[edge[i][0]-1].append(edge[i][1]-1)
        graph[edge[i][1]-1].append(edge[i][0]-1)
    }

    while !queue.isEmpty {
        currentDistance += 1
        let count = queue.count

        for _ in 0..<count {
            let here = queue.removeFirst()

            if distance[here] != Int.max {
                continue
            }

            distance[here] = currentDistance

            queue.append(contentsOf: graph[here])
        }
    }

    let m = distance.max()!

    return distance.filter { $0 == m }.count
}

solution(6, [[3, 6], [4, 3], [3, 2], [1, 3], [1, 2], [2, 4], [5, 2]])
