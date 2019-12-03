
// MARK: - 예산

import Foundation

func solution(_ d:[Int], _ budget:Int) -> Int {
    let arr = d.sorted()
    var Ans = 0
    var budget = budget
    for i in arr.indices {
        if budget >= arr[i] { budget -= arr[i]; Ans += 1 }
        else { break }
    }
    return Ans
}
