
// MARK: - 멀리뛰기 Lv3

import Foundation

func solution(_ n: Int) -> Int {
    var arr = [Int](repeating: 0, count: 2001)
    arr[1] = 1
    arr[2] = 2
    if n < 3 { return arr[n] }
    for i in 3 ... n { arr[i] = (arr[i - 1] + arr[i - 2]) % 1_234_567 }
    return arr[n]
}
