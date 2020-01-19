//: [Previous](@previous)

import Foundation

func solution(_ clothes: [[String]]) -> Int {
    var hash = [String: Int]()

    clothes.forEach {
        let feature = $0[1]
        let count = (hash[feature] ?? 0) + 1
        hash.updateValue(count, forKey: feature)
    }

    let result = hash.values.reduce(1) { r, v in
        return r * (v + 1)
    }

    return result - 1
}
print(solution([["yellow_hat", "headgear"], ["blue_sunglasses", "eyewear"], ["green_turban", "headgear"]]))
print(solution([["crow_mask", "face"], ["blue_sunglasses", "face"], ["smoky_makeup", "face"]]))
print(solution([["1", "a"], ["3", "a"], ["2", "b"], ["2", "d"], ["2", "c"]]))
