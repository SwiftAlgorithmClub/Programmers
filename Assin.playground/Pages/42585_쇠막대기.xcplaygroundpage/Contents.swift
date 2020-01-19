import Foundation

func solution(_ arrangement:String) -> Int {
    var st = [Int]()
    var cnt = 0

    
    let cs = arrangement.map{ $0 }
    for i in 0..<cs.count {
        switch cs[i] {
        case "(":
            st.append(i)
        case ")":
            if st.isEmpty { continue }
            let last = st.removeLast()
            if last == i-1 {    // raser
                cnt += st.count
            }else{      // end of the last stick..
                cnt += 1
            }

        default: break
        }
    }
    return cnt
}

print(solution("()(((()())(())()))(())"))
