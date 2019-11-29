import Foundation

func solution(_ n:Int) -> Int {
    var cache = Array(repeating: 0, count: n+1)

    cache[0] = 1
    cache[1] = 1
    if n < 2 {
        return cache[n]
    }
    for i in 2...n {
        for j in 0..<i {
            cache[i] += cache[j] * cache[i-j-1]
        }
    }

    return cache[n]
}
