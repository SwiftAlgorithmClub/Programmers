
// MARK: - 스티커모으기(2) Lv4

import Foundation

func solution(_ sticker: [Int]) -> Int {
    if sticker.count == 1 { return sticker[0] }
    var answer = 0, maxSum = 0, maxSum2 = 0
    var prev = 0, twoPrev = 0

    for i in 0 ..< sticker.count - 1 {
        maxSum = max(twoPrev + sticker[i], prev)
        twoPrev = prev
        prev = maxSum
        answer = answer < maxSum ? maxSum : answer
    }

    prev = 0
    twoPrev = 0
    for i in 1 ..< sticker.count {
        maxSum2 = max(twoPrev + sticker[i], prev)
        twoPrev = prev
        prev = maxSum2
        answer = answer < maxSum2 ? maxSum2 : answer
    }

    return answer
}
