
// MARK: - 단어변환 Lv3

import Foundation

var Ans = -1

func checkStr(_ strA: inout String, _ strB: inout String) -> Bool {
    let arrA = Array(strA), arrB = Array(strB)
    var diff = 0
    for i in arrA.indices {
        if arrA[i] != arrB[i] { diff += 1 }
        if diff > 1 { return false }
    }
    return true
}

func DFS(_ start: inout String, _ last: inout String, _ word: inout [String], _ dic: inout [String:Int], _ count: Int) {
    if start == last {
        if Ans == -1 { Ans = count }
        else { Ans = Ans > count ? count : Ans }
    }

    if dic[start] != nil { return }
    else { dic[start] = 1 }

    for i in word.indices {
        var tempWord = word[i]
        if checkStr(&start, &word[i]) { DFS(&tempWord, &last, &word, &dic, count+1) }
    }
}

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    var start = begin, last = target
    var word = words
    var dic = [String:Int]()
    DFS(&start, &last, &word, &dic, 0)

    return Ans == -1 ? 0 : Ans
}

