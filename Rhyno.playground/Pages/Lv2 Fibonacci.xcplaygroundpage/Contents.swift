import Foundation

var cache: [Int] = Array(repeating: -1, count: 100001)
func solution(_ n:Int) -> Int {
    if n == 0 {
        return 0
    }

    if n == 1 {
        return 1
    }

    if cache[n] != -1 {
        return cache[n]
    }

    cache[n] = (solution(n-1) + solution(n-2))%1234567
    return cache[n]
}
