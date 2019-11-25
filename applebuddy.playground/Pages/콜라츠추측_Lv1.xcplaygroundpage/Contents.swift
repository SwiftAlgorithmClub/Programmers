
// MARK: - 콜라츠추측 Lv1

import Foundation

func solution(_ num:Int) -> Int {
    var Cnt = 0, N = num
    if N == 1 { return 0 }
    while(true) {
        Cnt += 1
        if Cnt > 500 { return -1 }
        if N % 2 == 0 { N /= 2 }
        else { N *= 3; N += 1 }
        if N == 1 { break }
    }
    return Cnt
}
