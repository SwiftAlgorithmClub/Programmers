
// MARK: - 기능개발 Lv2

import Foundation

func solution(_ progresses: [Int], _ speeds: [Int]) -> [Int] {
    var taskQueue = [Int]()
    var Ans = [Int]()
    for i in progresses.indices {
        taskQueue.append((100 - progresses[i] - 1) / speeds[i] + 1)
    }

    while !taskQueue.isEmpty {
        var count = 1
        let nowTime = taskQueue.first!
        taskQueue.removeFirst()
        while !taskQueue.isEmpty {
            if taskQueue.first! <= nowTime {
                taskQueue.removeFirst()
                count += 1
            } else { break }
        }
        Ans.append(count)
    }
    return Ans
}
