

// MARK: - 처음 푼 버전 (stride 2중 for문 사용, 두번째보다 빠름)

func tower(_ heights: [Int]) -> [Int] {
    var Ans = [Int](repeating: 0, count: heights.count)
    for i in stride(from: heights.count - 1, through: 0, by: -1) {
        for j in stride(from: i - 1, through: 0, by: -1) {
            if heights[i] < heights[j] {
                Ans[i] = j + 1
                break
            }
        }
    }
    return Ans
}


//// MARK: - 두번째 푼 버전 (for + whilw문 사용, 제공 테케 기준 첫번째보다 좀더 느림)
//
//import Foundation
//
//func solution(_ heights:[Int]) -> [Int] {
//    let arr = heights
//    var Ans = [Int](repeating: 0, count: heights.count)
//
//    var nowArr = [Int]()
//    var temp = [Int]()
//    for i in arr.indices {
//        nowArr.append(arr[i])
//        var idx = 0
//        while(!temp.isEmpty) {
//            if temp.last! > arr[i] { break }
//            else {
//                temp.removeLast()
//                idx+=1
//            }
//        }
//        temp = nowArr
//        Ans[i] = i - idx
//    }
//    return Ans
//}

solution([1,2,3])
