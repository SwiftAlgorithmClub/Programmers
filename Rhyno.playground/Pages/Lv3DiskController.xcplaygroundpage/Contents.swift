struct Work: Comparable {
    let arrivedTime: Int
    let processTime: Int

    static func < (_ lhs: Work, _ rhs: Work) -> Bool {
        return lhs.processTime < rhs.processTime
    }
}

extension Array where Element == Work {
    mutating func binaryInsert(_ element: Work) {
        if isEmpty {
            self.append(element)
        } else {
            var left = 0
            var right = count-1

           while left <= right {
                let mid = (left+right)/2

                if self[mid]<element {
                    left = mid+1
                } else {
                    right = mid-1
                }
            }

            self.insert(element, at: left)
        }
    }
}

func solution(_ jobs:[[Int]]) -> Int {
    let sorted = jobs.sorted {
        if $0[0] != $1[0] {
            return $0[0] < $1[0]
        } else {
            return $0[1] < $1[1]
        }
    }

    guard let first = sorted.first else {
        return 0
    }

    var time: Int = first[0]
    var watingTime: Int = 0
    var pq: [Work] = [Work(arrivedTime: first[0], processTime: first[1])]
    var cursor = 1

    while cursor < sorted.count || !pq.isEmpty {
        if pq.isEmpty {
            time = sorted[cursor][0]
            pq.binaryInsert(Work(arrivedTime: sorted[cursor][0],
                                 processTime: sorted[cursor][1]))
            cursor+=1
        } else {
            let nextWork = pq.removeFirst()
            time += nextWork.processTime
            watingTime += time - nextWork.arrivedTime
            while cursor < sorted.count,
                sorted[cursor][0] <= time {
                    pq.binaryInsert(Work(arrivedTime: sorted[cursor][0],
                                         processTime: sorted[cursor][1]))
                    cursor += 1
            }
        }
    }

    return watingTime / sorted.count
}

solution([[0, 9], [0, 4], [0, 5], [0, 7], [0, 3]])
