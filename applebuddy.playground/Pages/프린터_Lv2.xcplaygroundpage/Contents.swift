
// MARK: 프린터 Lv2

import Foundation

func solution(_ priorities: [Int], _ location: Int) -> Int {
    var maxQueue = priorities.sorted()
    var pArr = [(Int, Int)]()
    for i in priorities.indices { pArr.append((i, priorities[i])) }

    var Ans = 0
    while !maxQueue.isEmpty {
        if pArr.first!.1 == maxQueue.last! {
            Ans += 1
            if pArr.first!.0 == location { break }
            else {
                pArr.removeFirst()
                maxQueue.removeLast()
            }
        } else {
            var front = pArr.first!
            pArr.removeFirst()
            pArr.append(front)
        }
    }

    return Ans
}
