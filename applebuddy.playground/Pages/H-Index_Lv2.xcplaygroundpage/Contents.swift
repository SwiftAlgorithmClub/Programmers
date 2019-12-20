
// MARK: H-Index Lv2

import Foundation

func solution(_ citations: [Int]) -> Int {
    let citat = citations.sorted()
    for H in stride(from: 1000, to: 0, by: -1) {
        var qCnt = 0
        var flag = true
        for j in citat.indices {
            if H <= citat[j] { qCnt += 1 }
            else {
                if citat[j] > H {
                    flag = false
                    break
                }
            }
        }
        if H <= qCnt, flag { return H }
    }

    return 0
}
