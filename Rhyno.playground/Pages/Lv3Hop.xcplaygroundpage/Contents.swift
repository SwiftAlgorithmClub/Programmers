import Foundation

func solution(_ n:Int) -> Int {
    var cache = Array(repeating: 0, count: n+2)
    cache[1] = 1
    cache[2] = 2
    if n < 3 {
        return cache[n]
    }

    for i in 3...n {
        cache[i] = (cache[i-1] + cache[i-2]) % 1234567
    }

    return cache[n]
}
