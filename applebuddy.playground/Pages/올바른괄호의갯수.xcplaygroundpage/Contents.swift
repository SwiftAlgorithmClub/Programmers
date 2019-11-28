
// MARK: - 올바른 괄호의 갯수

import Foundation

var arr = [String](repeating: "", count: 15)
var Ans = 0
func checkBrace(_ idx: Int, _ o: Int, _ c: Int) {
    if o == 0 {
        // for i in arr.indices { print("\(arr[i])", terminator: "") }
        // for _ in 0..<c { print("}", terminator: "") }
        // print()
        Ans += 1
        return
    }

    // arr[idx] = "{"
    checkBrace(idx + 1, o - 1, c)

    if o < c {
        // arr[idx] = "}"
        checkBrace(idx + 1, o, c - 1)
    }
}

func solution(_ n: Int) -> Int {
    checkBrace(0, n, n)
    return Ans
}
