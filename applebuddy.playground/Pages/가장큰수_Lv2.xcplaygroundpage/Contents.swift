
// MARK: - 가장 큰 수 Lv2

import Foundation

// 1) 첫번째 풀이 답안
func solution(_ numbers:[Int]) -> String {
    var Ans: String = ""
    numbers.sorted { return "\($0)\($1)" > "\($1)\($0)" }.forEach { Ans += "\($0)" }
    return Array(Ans)[0] == "0" ? "0" : Ans
}

// 2) 두번째 수정 답안, 문자 prefix값 접근 방법 수정,
//    -> 1번째 답안보다 다소 빠른 실행결과
func solution2(_ numbers:[Int]) -> String {
    var Ans: String = ""
    numbers.sorted { return "\($0)\($1)" > "\($1)\($0)" }.forEach { Ans += "\($0)" }
    return Ans.prefix(1) == "0" ? "0" : Ans
}


