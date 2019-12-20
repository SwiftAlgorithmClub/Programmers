//: [Previous](@previous)
import Foundation

func solution(_ n:Int, _ a:Int, _ b:Int) -> Int
{
    var answer = 0
    var a = a
    var b = b

    while (a-1)/2 != (b-1)/2 {
        a = (a-1)/2 + 1
        b = (b-1)/2 + 1
        answer += 1
    }
    return answer
}
