import Foundation

struct UFSet {
     var root: [Int]
     var count: [Int]

     init(_ N: Int) {
         root = Array(0..<N)
         count = Array(repeating: 1, count: N)
     }

     mutating func find(_ x: Int) -> Int {
         if root[x] == x {
             return x
         }

         root[x] = self.find(root[x]) // 현재 노드의 루트 노드를 바꿔준다.

         return root[x]
     }

     mutating func union(_ x:Int, _ y:Int) {
         let a = self.find(x)
         let b = self.find(y)

         let totalCount = count[a] + count[b]

         if a == b {
             return
         } else if count[a] > count[b] {
             root[b] = a
             count[a] = totalCount // 랭크를 조정해준다.
         } else {
             root[a] = b
             count[b] = totalCount
         }
     }
 }

func solution(_ n:Int, _ costs:[[Int]]) -> Int {
    var answer = 0
    var link = 0
    var set: UFSet = UFSet(n)

    let costs = costs.sorted { $0[2] < $1[2] }

    for c in costs {
        if set.find(c[0]) != set.find(c[1]) {
            answer += c[2]
            set.union(c[0], c[1])
            link += 1
        }
        if link == n-1 { break }
    }

    return answer
}
