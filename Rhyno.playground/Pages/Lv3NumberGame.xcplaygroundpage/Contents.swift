import Foundation

func solution(_ a:[Int], _ b:[Int]) -> Int {

    let sA = a.sorted()
    let sB = b.sorted()
    var index = 0

    for e in sB {
        if e > sA[index] {
            index += 1
        }
    }

    return index
}
