
// MARK: - 멀쩡한 사각형

import Foundation

func getGCD(_ a: Int, _ b: Int) -> Int {
    if b == 0 { return a }
    else { return getGCD(b, a % b) }
}

func solution(_ w: Int, _ h: Int) -> Int64 {
    return Int64(w * h - (w + h - getGCD(w, h)))
}
