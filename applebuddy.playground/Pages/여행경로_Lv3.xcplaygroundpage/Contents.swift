
// MARK: - 여행경로 Lv3 문제풀이

import Foundation

var Ans = [String]()

func DFS(_ start: String, _ count: Int, _ visit: inout [Bool], _ route: inout [String], _ tickets: inout [[String]]) -> Bool {
    route.append(start)
    if count == tickets.count { Ans = route; return true }

    for i in tickets.indices {
        if tickets[i][0] != start || visit[i] == true { continue }
        visit[i] = true
        if DFS(tickets[i][1], count + 1, &visit, &route, &tickets) {
            return true
        } else {
            visit[i] = false
        }
    }

    route.removeLast()
    return false
}

func solution(_ tickets: [[String]]) -> [String] {
    var visit = [Bool](repeating: false, count: 10001)
    var route = [String]()
    var Ticket = tickets.sorted {
        $0.joined() < $1.joined()
    }

    let isSucceed = DFS("ICN", 0, &visit, &route, &Ticket)
    return isSucceed ? Ans : []
}
