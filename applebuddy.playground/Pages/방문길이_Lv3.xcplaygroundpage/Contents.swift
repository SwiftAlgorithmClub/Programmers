
// MARK: - 방문길이 Lv3

import Foundation

struct TwoPoint: Hashable {
    var pX: Int
    var pY: Int
    var X: Int
    var Y: Int
}

struct Point: Hashable {
    var X: Int
    var Y: Int
}

func solution(_ dirs: String) -> Int {
    var Ans = 0
    var nowPos = Point(X: 0, Y: 0)
    var prevPos = Point(X: 0, Y: 0)
    var dic = [TwoPoint: Int]()
    let dirArr = Array(dirs)

    for i in dirArr.indices {
        prevPos = nowPos
        if dirArr[i] == "L", nowPos.X > -5 { nowPos.X = nowPos.X - 1 }
        if dirArr[i] == "R", nowPos.X < 5 { nowPos.X = nowPos.X + 1 }
        if dirArr[i] == "U", nowPos.Y < 5 { nowPos.Y = nowPos.Y + 1 }
        if dirArr[i] == "D", nowPos.Y > -5 { nowPos.Y = nowPos.Y - 1 }

        let posIdx = TwoPoint(pX: prevPos.X, pY: prevPos.Y, X: nowPos.X, Y: nowPos.Y)
        let posIdxR = TwoPoint(pX: nowPos.X, pY: nowPos.Y, X: prevPos.X, Y: prevPos.Y)
        if dic[posIdx] == nil, dic[posIdxR] == nil, nowPos != prevPos {
            dic[posIdx] = dic[posIdx] ?? 0 + 1
            dic[posIdxR] = dic[posIdxR] ?? 0 + 1
            Ans = Ans + 1
        }
    }
    return Ans
}

var Ans = solution("ULURRDLLU")
// var Ans = solution("LULLLLLLU")
print("\(Ans)")
