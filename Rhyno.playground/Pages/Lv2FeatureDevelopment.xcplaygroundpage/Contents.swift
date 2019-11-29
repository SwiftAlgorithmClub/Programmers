import Foundation

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {

    var progresses = progresses
    var result: [Int] = []

    var current = 0
    while current != progresses.count {
        let prev = current

        let daysToComplete = (99 - progresses[current]) / speeds[current] + 1

        for i in current..<progresses.count {
            progresses[i] += speeds[i] * daysToComplete
        }

        while current < progresses.count,
            progresses[current] >= 100 {
            current += 1
        }

        result.append(current - prev)
    }

    return result
}
