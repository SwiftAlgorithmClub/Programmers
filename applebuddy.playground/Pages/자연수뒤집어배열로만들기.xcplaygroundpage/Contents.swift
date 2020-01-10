
import Foundation

func solution(_ n:Int64) -> [Int] {
    return Array(String(n)).compactMap { Int(String($0)) }.reversed()
}
