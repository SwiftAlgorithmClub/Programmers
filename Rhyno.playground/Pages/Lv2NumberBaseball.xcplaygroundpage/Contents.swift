import Foundation

extension Int {
    func isValidGame(_ num: Int, _ strike: Int, _ ball: Int) -> Bool {
        guard self.isValidNumber else {
            return false
        }

        var st = 0
        var ba = 0

        let char1 = Array(String(self))
        let char2 = Array(String(num))

        for (i,j) in zip(char1, char2) {
            if i == j {
                st += 1
            } else if char1.contains(j) {
                ba += 1
            }
        }

        if st == strike,ba == ball {
            return true
        }

        return false
    }

    var isValidNumber: Bool {
        let char = Array(String(self))
        if char.contains(Character("0")) {
            return false
        }

        if char[0] == char[1] || char[1] == char[2] || char[0] == char[2] {
            return false
        }

        return true
    }
}

func solution(_ baseball:[[Int]]) -> Int {
    var answer = 0

    for i in 100..<1000 {
        for game in 0..<baseball.count {
            let g = baseball[game]
            guard i.isValidGame(g[0], g[1], g[2]) else {
                break
            }

            if game == baseball.count-1 {
                answer += 1
            }
        }
    }

    return answer
}

solution([[123, 1, 1], [356, 1, 0], [327, 2, 0], [489, 0, 1]])
