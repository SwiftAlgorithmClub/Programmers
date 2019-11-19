import Foundation

func solution(_ strs:[String], _ t:String) -> Int{

    let INFINITY = 20001
    let strSet: Set<String> = Set(strs)
    var cache:[Int] = Array(repeating: INFINITY, count: t.count+1)
    let tCount = t.count
    cache[tCount] = 0

    var cacheIndex = tCount
    var strIndex = t.endIndex

    while strIndex != t.startIndex {
        cacheIndex -= 1
        strIndex = t.index(before: strIndex)

        for j in 0..<5 {
            let nIndex = cacheIndex + j
            if nIndex >= tCount {
                break
            }

            let end = t.index(strIndex, offsetBy: j)
            let current = String(t[strIndex...end])

            if strSet.contains(current) {
                cache[cacheIndex] = min(cache[cacheIndex], cache[nIndex+1]+1)
            }
        }
    }

    return cache[0] == INFINITY ? -1 : cache[0]
}

solution(["ba","na","n","a"], "banana")
