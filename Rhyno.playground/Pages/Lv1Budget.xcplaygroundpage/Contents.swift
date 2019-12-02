import Foundation

func solution(_ d:[Int], _ budget:Int) -> Int {
    var answer = 0
    var budget = budget
    let d = d.sorted()

    for b in d {
        if budget - b >= 0 {
            answer += 1
            budget -= b
        } else {
            break
        }
    }

    return answer
}

solution([2,2,3,3], 10)
