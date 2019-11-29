
// MARK: - 가장 먼 노드

import Foundation

var C = [Int](repeating: 0, count: 20001)
var G = [[Int]](repeating: [Int](), count: 20001)
var dic = [Int: Int]()
var maxDist = 0
func BFS(_ Node: Int) {
    var queue = [Int]()
    C[Node] = 1
    queue.append(Node)

    while !queue.isEmpty {
        var node = queue.first!
        queue.removeFirst()
        for i in G[node].indices {
            var nextNode = G[node][i]
            if C[nextNode] == 0 {
                C[nextNode] = C[node] + 1
                dic[C[nextNode]] = (dic[C[nextNode]] ?? 0) + 1
                maxDist = maxDist < C[nextNode] ? C[nextNode] : maxDist
                queue.append(nextNode)
            }
        }
    }
}

func solution(_: Int, _ edge: [[Int]]) -> Int {
    for i in edge.indices {
        G[edge[i][0]].append(edge[i][1])
        G[edge[i][1]].append(edge[i][0])
    }

    BFS(1)
    return dic[maxDist]!
}
