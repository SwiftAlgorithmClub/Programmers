
import Foundation

func solution(_ n:Int64) -> Int64 {
    let sqt: Int64 = Int64(sqrt(Double(n)))
    return sqt * sqt == n ? Int64((sqt + 1) * (sqt + 1)) : -1
}
