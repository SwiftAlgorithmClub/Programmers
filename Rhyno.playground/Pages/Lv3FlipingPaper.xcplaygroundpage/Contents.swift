import Foundation

func solution(_ n:Int) -> [Int] {
    let totalPiece = 1<<n - 1
    var result: [Int] = Array(repeating: 0, count: totalPiece)
    var queue: [(Int,Int,Int)] = []
    queue.append((0,totalPiece,0))

    while let args = queue.popLast() {
        let center = (args.0 + args.1) / 2

        result[center] = args.2

        if center-args.0 > 0 {
            queue.append((args.0, center ,0))
        }

        if args.1-center > 1 {
            queue.append((center+1,args.1,1))
        }
    }

    return result
}
