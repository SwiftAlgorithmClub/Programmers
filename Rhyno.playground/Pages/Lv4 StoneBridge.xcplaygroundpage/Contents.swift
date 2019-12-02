import Foundation

func solution(_ distance:Int, _ rocks:[Int], _ n:Int) -> Int {
    var answer = 0
    var rocks = rocks.sorted()

    if let last = rocks.last,
        last != distance {
        rocks.append(distance)
    }

    var min = 1
    var max = distance

    while min <= max {
        let mid = (min+max)/2

        var p = 0
        var removed = 0

        for r in rocks {
            if r - p < mid {
                removed += 1
            } else {
                p = r
            }
        }

        if removed > n {
            max = mid - 1
        } else {
            if answer < mid {
                answer = mid
            }

            min = mid + 1
        }
    }
    return answer
}
