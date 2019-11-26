import Foundation

func hanoi(_ from: Int, _ by:Int, _ to:Int, _ n: Int,  _ result: inout [[Int]]) {
    if n == 1 {
        result.append([from,to])
        return
    }
    hanoi(from, to, by, n-1, &result)
    hanoi(from, by, to, 1, &result)
    hanoi(by, from, to ,n-1, &result)
}
extension Array where Element == [Int] {

}
func solution(_ n:Int) -> [[Int]] {
    var result: [[Int]] = []
    hanoi(1,2,3, n, &result)
    return result
}

solution(2)
