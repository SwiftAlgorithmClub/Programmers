
// MARK: - 숫자야구 Lv2

import Foundation

func solution(_ baseball:[[Int]]) -> Int {

    var answer = 0
    for i in 123...987 {
        var dic = [Character:Int]()
        var ansArr = Array(String(i))
        var flag = true
        for i in ansArr.indices { dic[ansArr[i]] = dic[ansArr[i]] ?? 0 + 1 }
        if dic["0"] != nil || dic.count != 3 { continue }

        for j in baseball.indices {
            var questArr = Array(String(baseball[j][0]))
            var strike = 0, ball = 0
            for k in ansArr.indices {
                if questArr[k] == ansArr[k] { strike += 1 }
                else if dic[questArr[k]] != nil { ball += 1 }
            }
            if strike != baseball[j][1] || ball != baseball[j][2] { flag = false; break }
        }
        if flag { answer += 1 }
    }
    return answer
}
