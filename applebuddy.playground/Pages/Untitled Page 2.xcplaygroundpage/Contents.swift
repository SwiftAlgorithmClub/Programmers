
// MARK: 조이스틱 LV2

import Foundation

let alpha: [Character: Int] = [
    "A":0, "B":1, "C":2, "D":3, "E":4, "F":5, "G":6,
    "H":7, "I":8, "J":9, "K":10, "L":11, "M":12, "N":13,
    "O":14, "P":15, "Q":16, "R":17, "S":18, "T":19, "U":20,
    "V":21, "W":22, "X":23, "Y":24, "Z":25
]

func solution(_ name:String) -> Int {
    let Name = Array(name)
    var cName = [Character](repeating: "A", count: Name.count)
    var nowIdx = 0, Ans = 0
    
    while Name != cName {
        var fromAlpha = alpha[cName[nowIdx]]!
        var toAlpha = alpha[Name[nowIdx]]!
        
        if fromAlpha > toAlpha { swap(&fromAlpha, &toAlpha) }
        
        let sDist = min(toAlpha - fromAlpha, 26-(toAlpha - fromAlpha))
        Ans += sDist
        cName[nowIdx] = Name[nowIdx]
        
        if Name == cName { break }
        
        var nextIdx = 0
        var nextDist = Name.count
        for i in Name.indices {
            if nowIdx == i || cName[i] == Name[i] { continue }
            let diff = Int(abs(Double(nowIdx-i)))
            let tDist = min(diff, Name.count-diff)
            if nextDist > tDist {
                nextDist = tDist
                nextIdx = i
            }
        }
        nowIdx = nextIdx
        Ans += nextDist
    }
    
    return Ans
}
