
// MARK: - QuickSort Example with Swift

import Foundation

func quickSort(_ arr: inout [Int], _ start: Int, _ end: Int) {
    if start >= end { return } // 원소가 한 개인 경우 바로 종료

    let key = start // 키는 첫번째 원소
    var i = start + 1
    var j = end
    var temp = 0

    while i <= j { // 엇갈릴 때 까지 반복
        while arr[i] <= arr[key] {
            i += 1
        }

        while arr[j] >= arr[key], j > start {
            j -= 1
        }

        if i > j {
            temp = arr[j]
            arr[j] = arr[key]
            arr[key] = temp
        } else {
            temp = arr[i]
            arr[i] = arr[j]
            arr[j] = temp
        }
    }

    quickSort(&arr, start, j - 1)
    quickSort(&arr, j + 1, end)
}

var arr = [3, 1, 5, 4, 2, 6, 9, 7, 8, 0]
quickSort(&arr, 0, arr.count - 1) // 퀵정렬에 의해 오름차순 정렬이 된다.
print(arr) // [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
