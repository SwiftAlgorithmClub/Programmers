
// MARK: 쇠막대기

// MARK: - 스택 미사용 풀이답안

import Foundation

func solution2(_ arrangement: String) -> Int {
    let arr = Array(arrangement)
    var Ans = 0
    var depth = 0
    for i in arr.indices {
        if arr[i] == "(" { depth += 1 }
        else {
            depth -= 1
            if arr[i - 1] == "(" { Ans += depth }
            else { Ans += 1 }
        }
    }
    return Ans
}

// MARK: - 스택배열 사용 풀이 답안

import Foundation

func solution(_ arrangement: String) -> Int {
    let arr = Array(arrangement)
    var stk = [Character]()
    var Ans = 0
    for i in arr.indices {
        if arr[i] == "(" { stk.append(arr[i]) }
        else {
            stk.removeLast()
            if arr[i - 1] == "(" { Ans += stk.count }
            else { Ans += 1 }
        }
    }
    return Ans
}
