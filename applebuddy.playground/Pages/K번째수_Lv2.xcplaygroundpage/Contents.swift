
// MARK: K번째수 Lv2

import Foundation

func solution(_ array: [Int], _ commands: [[Int]]) -> [Int] {
    return commands.map { array[$0[0] - 1 ... $0[1] - 1].sorted()[$0[2] - 1] }
}
