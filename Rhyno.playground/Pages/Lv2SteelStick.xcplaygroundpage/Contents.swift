import Foundation

func solution(_ arrangement:String) -> Int {
    var stack: [Character] = []
    var result = 0

    var willBeLaser = false

    for c in arrangement {
        if c == Character("(") {
            stack.append(c)
            willBeLaser = true
        } else {
            stack.popLast()
            if willBeLaser {
                result += stack.count
                willBeLaser = false
            } else {
                result += 1
            }
        }
    }

    return result
}

solution("()(((()())(())()))(())")
