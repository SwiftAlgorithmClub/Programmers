//: [Previous](@previous)

func solution(_ n:Int) -> Int
{
    let answer = String(n).compactMap { Int(String($0)) }.reduce(0) { $0 + $1 }
    
    return answer
}

//: [Next](@next)
