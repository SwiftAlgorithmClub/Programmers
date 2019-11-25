import Foundation

func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    var bridge = Array(repeating: 0, count: truck_weights.count)
    var answer = 0
    var currentWeight = 0
    var needToLoad = 0
    var bridgeStart = 0, bridgeEnd = 0

    while bridgeStart != bridge.endIndex {
        answer += 1 // 1초 증가

        // 1칸씩 전진
        for i in bridgeStart..<bridgeEnd {
            bridge[i] += 1

            if bridge[i] == bridge_length { // 다리를 다 건너면 빼준다.
                bridgeStart += 1
                currentWeight -= truck_weights[i]
            }
        }

        // 트럭이 다리에 올라가는 과정
        if needToLoad < truck_weights.count,
            currentWeight + truck_weights[needToLoad] <= weight {
            currentWeight += truck_weights[needToLoad]
            needToLoad += 1
            bridgeEnd += 1
        }



    }

    return answer
}

solution(100, 100, [10,10,10,10,10,10,10,10,10,10])
