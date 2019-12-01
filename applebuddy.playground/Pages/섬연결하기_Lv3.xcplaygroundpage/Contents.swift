
// MARK: - 섬 연결하기 Lv3

import Foundation

var parent = [Int]()

struct Edge {
    var node = (0, 0)
    var W = 0
}

func getParent(_ N: Int) -> Int {
    if parent[N] == N { return N }
    else { return getParent(parent[N]) }
}

func mergeParent(_ A: Int, _ B: Int) {
    let parentA = getParent(A)
    let parentB = getParent(B)
    if parentA < parentB { parent[parentB] = A }
    else { parent[parentA] = B }
}

func solution(_ n:Int, _ costs:[[Int]]) -> Int {
    var COST = 0
    var EV = [Edge]()
    parent = [Int](0..<n+1)

    for i in costs.indices {
        EV.append(Edge(node: (costs[i][0],costs[i][1]), W: costs[i][2]))
    }

    EV.sort { $0.W < $1.W }
    var idx = 0, cnt = 0
    while cnt != n-1 {
        let nodeA = EV[idx].node.0
        let nodeB = EV[idx].node.1
        if getParent(nodeA) != getParent(nodeB) {
            mergeParent(nodeA, nodeB)
            COST += EV[idx].W
            cnt += 1
        }
        idx += 1
    }

    return COST
}
