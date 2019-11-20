import Foundation

func solution(_ s:String) -> Int {
    let count = s.count

    if count == 1 {
        return 1
    }

    var result = 1
    let begin = s.startIndex
    let end = s.index(before: s.endIndex)

    var cursor = s.startIndex

    for _ in 0..<count-1 {

        var temp = 1

        // sas' 타입의 팰린드롬 검사
        if cursor != begin {
            var beforeCursor = s.index(before: cursor)
            var afterCursor = s.index(after: cursor)

            while s[beforeCursor] == s[afterCursor] {
                temp += 2
                if beforeCursor == begin || afterCursor == end {
                    break
                }

                beforeCursor = s.index(before: beforeCursor)
                afterCursor = s.index(after: afterCursor)
            }
        }

        result = max(result,temp)

        temp = 0
        // ss' 타입의 팰린드롬 검사
        if cursor != end {
            var leftCursor = cursor
            var rightCursor = s.index(after: cursor)

            while s[leftCursor] == s[rightCursor] {
                temp += 2
                if leftCursor == begin || rightCursor == end {
                    break
                }

                leftCursor = s.index(before: leftCursor)
                rightCursor = s.index(after: rightCursor)
            }
        }

        result = max(result,temp)
        cursor = s.index(after: cursor)
    }

    return result
}
