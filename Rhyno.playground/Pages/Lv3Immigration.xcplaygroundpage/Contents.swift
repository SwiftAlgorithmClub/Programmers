import Foundation

func solution(_ n:Int, _ times:[Int]) -> Int64 {

    var left = 0
    var right = times.max()! * n
    var answer = Int.max

    while left <= right {
        let mid = (left + right) / 2

        let people = times.reduce(0) { $0 + mid / $1 }

        if people >= n {
            answer = mid
            right = mid - 1
        } else {
            left = mid + 1
        }
    }

    return Int64(answer)
}
