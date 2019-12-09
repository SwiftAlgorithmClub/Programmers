
// MARK: - 여행경로 Lv3 문제풀이

import Foundation

var Ans = [String]()
func DFS(_ start: String, _ count: Int, _ route: inout [String], _ tickets: inout [[String]], _ visited: inout [Bool]) -> Bool {
    route.append(start)
    if tickets.count == count { Ans = route; return true }
    for i in tickets.indices {
        if tickets[i][0] != start || visited[i] { continue }
        visited[i] = true
        if DFS(tickets[i][1], count + 1, &route, &tickets, &visited) {
            return true
        }
        visited[i] = false
    }

    route.removeLast()
    return false
}

func solution(_ tickets: [[String]]) -> [String] {
    var sortedTicket = tickets.sorted { $0.joined() < $1.joined() }
    var visited = [Bool](repeating: false, count: 10001)
    var route = [String]()
    DFS("ICN", 0, &route, &sortedTicket, &visited)
    return Ans
}
