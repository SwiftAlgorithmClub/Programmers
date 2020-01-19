
import Foundation

func solution(_ priorities: [Int], _ location: Int) -> Int {
    let v = priorities[location]
    var count = 0
    for i in 0..<priorities.count {
        if location == i {
            continue
        }
        print("!!! \(v) \(priorities[i])")
        if v <= priorities[i] {
            count += 1
        }
    }
    return Swift.max(count, 1)
}
solution([1, 1, 9, 1, 1, 1], 0)
solution([2, 1, 3, 2], 2)
solution([2, 1, 3, 2], 2)

