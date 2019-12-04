import Foundation

extension String {
    func distance(with str: String) -> Int {
        return zip(self,str).filter({ $0.0 != $0.1 }).count
    }
}

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {

    guard words.contains(target)else {
        return 0
    }
    let words = [begin] + words
    var graph: [[Int]] = Array(repeating: [], count: words.count)

    for i in 0..<words.count {
        for j in i+1..<words.count {
            if i != j,words[i].distance(with: words[j]) == 1 {
                graph[i].append(j)
                graph[j].append(i)
            }
        }
    }

    var distance = 0
    var visited = Array(repeating: false,count: words.count)

    var queue = [0]

    while !queue.isEmpty {
        let c = queue.count

        for _ in 0..<c {
            let here = queue.removeFirst()

            if visited[here] {
                continue
            }

            visited[here] = true

            for j in graph[here] {
                if j != 0,target == words[j] {
                    return distance+1
                }
                queue.append(j)
            }
        }

        distance+=1
    }

    return 0
}

solution("hit", "cog", ["hot", "dot", "dog", "lot", "log", "cog"])
