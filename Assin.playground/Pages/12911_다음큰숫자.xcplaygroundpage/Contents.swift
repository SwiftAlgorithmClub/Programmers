import Foundation

func solution(_ n: Int) -> Int
{
    
    let binary = String(n, radix: 2)
    let ones = oneCount(binary)
    
    var nextInt = n
    while true {
        nextInt += 1
        let b = String(nextInt, radix: 2)
        if ones == oneCount(b) {
            return nextInt
        }
    }
}


func oneCount(_ binary: String) -> Int {
    var oneCount = 0
    for b in binary {
        if b == "1" {
            oneCount += 1
        }
    }
    return oneCount
}

solution(78) // 83
