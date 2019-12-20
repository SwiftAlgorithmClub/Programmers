
// MARK: 예상대진표 Lv2

import Foundation

func getNextNum(_ num: inout Int) {
    if num == 1 { return }
    else {
        if num % 2 == 0 { num /= 2 }
        else { num = (num + 1) / 2 }
    }
}

func solution(_: Int, _ a: Int, _ b: Int) -> Int {
    var A = a, B = b, Ans = 0
    if a > b { swap(&A, &B) }
    while true {
        getNextNum(&A)
        getNextNum(&B)
        Ans += 1
        if B - A == 0 { break }
    }
    return Ans
}
