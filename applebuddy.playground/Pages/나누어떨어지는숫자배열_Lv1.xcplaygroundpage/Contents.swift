
// MARK: 나누어 떨어지는 숫자 배열 Lv1

func solution(_ arr: [Int], _ divisor: Int) -> [Int] {
    let Ans = arr.sorted().filter { $0 % divisor == 0 }
    return Ans.isEmpty ? [-1] : Ans
}
