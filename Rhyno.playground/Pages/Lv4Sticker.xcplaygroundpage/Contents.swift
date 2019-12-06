import Foundation

extension Array where Element == Int {
    func flatSticker(_ from: Int, _ end:Int) -> Int {
        let size = end - from
        if size <= 0 {
            return 0
        }

        var cache = Array(repeating: 0, count: size)

        cache[0] = self[from]

        for i in 1..<size {
            if i-1>0 {
                cache[i] = Swift.max(cache[i-1], cache[i-2]+self[from+i])
            } else {
                cache[i] = Swift.max(cache[i-1], self[from+i])
            }
        }

        return cache[size-1]
    }
}

func solution(_ sticker:[Int]) -> Int{

    return max(sticker.flatSticker(1, sticker.count),
               sticker.flatSticker(2, sticker.count-1) + sticker[0])
}


solution([14, 6, 5, 11, 3, 9, 2, 10])
