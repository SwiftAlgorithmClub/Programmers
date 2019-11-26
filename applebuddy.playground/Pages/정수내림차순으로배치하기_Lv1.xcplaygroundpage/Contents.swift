

// MARK: - 정수 내림차순으로 배치하기 Lv1

import Foundation

func solution(_ n: Int64) -> Int {
    var array: [Int] = []

    for number in String(n) {
        array.insert(Int(String(number)) ?? 0, at: 0)
    }

    var str = ""
    array.sort(by: >)
    array.forEach {
        str += String($0)
    }

    return Int(str)!
}
