//: [Previous](@previous)
import Foundation

func solution(_ n:Int, _ results:[[Int]]) -> Int {
    var result = 0
    var C: [[Bool]] = Array(repeating: Array(repeating:false, count: n), count: n)
    var D: [[Bool]] = Array(repeating: Array(repeating:false, count: n), count: n)

    for r in results {
        C[r[0]-1][r[1]-1] = true
        D[r[1]-1][r[0]-1] = true
    }

    for k in 0..<n {
        for i in 0..<n {
            for j in 0..<n {
                C[i][j] = C[i][j] || (C[i][k] && C[k][j])
                D[i][j] = D[i][j] || (D[i][k] && D[k][j])
            }
        }
    }

    for i in 0 ..< n {
        var canDetermine = true
        for j in 0 ..< n {
            if i != j {
                canDetermine = canDetermine && (C[j][i] || D[j][i])
            }
        }

        if canDetermine {
            result += 1
        }
    }
    return result
}

solution(5, [[4, 3], [4, 2], [3, 2], [1, 2], [2, 5]])
