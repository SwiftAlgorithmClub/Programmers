import Foundation

extension Array where Element == Int {
    mutating func dfs(_ k: Int) -> Int {
        if k == count {
            return 1
        }

        var result = 0
        for i in 0..<count {
            if isPromising(k, i) {
                self[k] = i
                result += dfs(k+1)
                self[k] = -1
            }
        }

        return result
    }

    private func isPromising(_ x:Int, _ y: Int) -> Bool {
        for i in 0..<x {
            if self[i] == y {
                return false
            }

            if abs(self[i]-y) == x-i {
                return false
            }
        }

        return true
    }
}

func solution(_ n:Int) -> Int {
    var position: [Int] = Array(repeating: -1, count: n)


    return position.dfs(0)
}

solution(4)
