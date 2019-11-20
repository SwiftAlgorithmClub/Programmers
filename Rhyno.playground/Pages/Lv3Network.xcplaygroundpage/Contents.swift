import Foundation

func solution(_ n:Int, _ computers:[[Int]]) -> Int {

    var visited: [Bool] = Array(repeating: false, count: n)
    var result = 0
    for i in 0..<n {
        if !visited[i] {
            result += 1
            visited.dfs(computers, i)
        }
    }

    return result
}

extension Array where Element == Bool {
    mutating func dfs(_ computers: [[Int]], _ n: Int) {
        if self[n] {
            return
        }

        self[n] = true

        for i in 0..<self.count {
            if i != n, computers[n][i] == 1 {
                dfs(computers, i)
            }
        }
    }
}
