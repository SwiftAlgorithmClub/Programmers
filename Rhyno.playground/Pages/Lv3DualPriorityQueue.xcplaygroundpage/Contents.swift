import Foundation

func solution(_ operations:[String]) -> [Int] {
    var isSorted = true
    var queue:[Int] = []

    for op in operations {

        guard let firstCharacter = op.first else {
            continue
        }
        let i = op.index(op.startIndex, offsetBy: 2)

        if firstCharacter == Character("I"),
            let number = Int(op[i...]){
            queue.append(number)
            isSorted = false
        } else { // D
            if queue.isEmpty {
                continue
            }
            if !isSorted {
                queue.sort()
            }

            if op[i] == Character("1") {
                queue.popLast()
            } else { // -1
                queue.removeFirst()
            }
        }
    }

    if !isSorted {
        queue.sort()
    }

    if queue.isEmpty {
        return [0,0]
    }

    return [queue.last!, queue.first!]
}

