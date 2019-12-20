import Foundation

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {

    var answer: [Int] = []
    for comm in commands{
        let temp = array[comm[0]-1...comm[1]-1].sorted()
        answer.append(temp[comm[2]-1])
    }
    return answer
}
