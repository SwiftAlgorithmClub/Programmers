
// MARK: - N으로표현 Lv3

import Foundation

var Ans = -1

func DFS(_ sum: Int, _ idx: Int, _ N: inout Int, _ target: inout Int) {
    if idx > 8 { return }
    else if sum == target {
        if Ans == -1 { Ans = idx }
        else { Ans = Ans > idx ? idx : Ans }
        return
    }
    
    var nowValue = 0
    for i in 0...7 {
        nowValue = nowValue*10 + N
        DFS(sum * nowValue, idx + i + 1, &N, &target)
        DFS(sum / nowValue, idx + i + 1, &N, &target)
        DFS(sum - nowValue, idx + i + 1, &N, &target)
        DFS(sum + nowValue, idx + i + 1, &N, &target)
    }
    
    return
}

func solution(_ N:Int, _ number:Int) -> Int {
    var target = number
    var num = N
    DFS(0, 0, &num, &target)

    return Ans;
}
