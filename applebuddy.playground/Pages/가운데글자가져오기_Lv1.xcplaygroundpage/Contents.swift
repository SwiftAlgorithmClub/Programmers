
// MARK: 가운데 글자 가져오기 Lv1

func solution(_ s: String) -> String {
    return s.count % 2 == 0 ? String(Array(s)[s.count / 2 - 1]) + String(Array(s)[s.count / 2]) : String(Array(s)[s.count / 2])
}
