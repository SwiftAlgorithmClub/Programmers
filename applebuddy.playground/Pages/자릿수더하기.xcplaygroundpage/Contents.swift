
// MARK: 자릿수더하기 문제풀이

import Foundation

func solution(_ n: Int) -> Int {
    var N = n, Ans = 0
    while N > 0 {
        Ans += N % 10
        N /= 10
    }
    return Ans
}
