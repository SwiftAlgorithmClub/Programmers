import Foundation

func solution(_ s:String) -> Bool
{
    var stack = [Character]()
    
    for i in 0..<s.count {
        
        if s[i] == "(" {
            stack.append(s[i])
        } else {
            if stack.isEmpty {
                return false
            } else {
                if "(" == stack.last {
                    stack.removeLast()
                } else {
                    return false
                }
            }
        }
    }
    return stack.isEmpty
}

extension String {
    public subscript(at: Int) -> Character {
        return self[self.index(self.startIndex, offsetBy: at)]
    }
}

print(solution("()()"))
print(solution("(())()"))
print(solution(")()("))

// 시간 초과.
//
//import Foundation
//
//func solution(_ s:String) -> Bool
//{
//    var ans:Bool = false
//
//    var openCnt: Int = 0, closeCnt: Int = 0
//
//    for ch in s {
//        switch ch {
//        case "(":
//            openCnt += 1
//        case ")":
//            closeCnt += 1
//        default:
//            break
//        }
//
//        guard openCnt >= closeCnt else {
//            break
//        }
//    }
//
//    ans = openCnt == closeCnt
//
//    return ans
//}
