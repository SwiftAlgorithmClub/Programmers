
// MARK: - 하노이의 탑

import Foundation

var Ans = [[Int]]()
func move(_ from: Int, _ to: Int) {
    Ans.append([from, to])
}

func hanoiAlgorithm(_ num: Int, _ from: Int, _ by: Int, _ to: Int) {
    if num == 0 { return }
    hanoiAlgorithm(num - 1, from, to, by)
    move(from, to)
    hanoiAlgorithm(num - 1, by, from, to)
}

func solution(_ n: Int) -> [[Int]] {
    hanoiAlgorithm(n, 1, 2, 3)
    return Ans
}
