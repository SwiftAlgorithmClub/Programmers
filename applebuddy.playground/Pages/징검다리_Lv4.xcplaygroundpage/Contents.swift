
// MARK: - 징검다리 Lv4

import Foundation

func solution(_ distance: Int, _ rocks: [Int], _ n: Int) -> Int {
    var rockArr = rocks.sorted()
    var answer = 0
    var left = 1, right = distance

    if rockArr.last! != distance { rockArr.append(distance) }
    while left <= right {
        var mid = (left + right) / 2, removed = 0, prevIdx = 0
        for i in rockArr.indices {
            if rockArr[i] - prevIdx < mid { removed += 1 }
            else { prevIdx = rockArr[i] }
        }

        if removed > n { right = mid - 1 }
        else {
            answer = answer < mid ? mid : answer
            left = mid + 1
        }
    }

    return answer
}
