
// MARK: 피보나치 수 Lv2

// MARK: - Call by Reference 사용 답안 (전역변수 참조방식보다 빴랐음)

import Foundation

func fibonachi(_ num: Int, _ arr: inout [Int]) -> Int {
    if num <= 2 { return 1 }
    else if arr[num] > 0 { return arr[num] }
    arr[num] = (fibonachi(num - 1, &arr) + fibonachi(num - 2, &arr)) % 1_234_567
    return arr[num]
}

func solution(_ n: Int) -> Int {
    var DP = [Int](repeating: 0, count: n + 1)
    return fibonachi(n, &DP)
}

// MARK: - 전역변수 사용 답안 (지역변수 주소참조 방식보다 전역변수 참조 방식이 더 걸렸음)

import Foundation

var DP = [Int]()

func fibonachi2(_ num: Int) -> Int {
    if num <= 2 { return 1 }
    else if DP[num] > 0 { return DP[num] }
    DP[num] = (fibonachi2(num - 1) + fibonachi2(num - 2)) % 1_234_567
    return DP[num]
}

func solution2(_ n: Int) -> Int {
    DP = [Int](repeating: 0, count: n + 1)
    return fibonachi2(n)
}
