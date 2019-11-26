
// MARK: - 핸드폰 번호 가리기

import Foundation

func solution(_ phone_number: String) -> String {
    var arr = String(phone_number).map { String($0) }
    for i in 0 ..< arr.count - 4 { arr[i] = "*" }
    return arr.joined()
}
