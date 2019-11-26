import Foundation

func isPrime(_ n:Int) -> Bool {
    if n < 2 {
        return false
    }

    let limit = Int(sqrt(Double(n)))
    if limit < 2 {
        return true
    }
    for i in 2...limit { // Range 다루기가 까다롭다 ㅜ
        if n % i == 0 {
            return false
        }
    }
    return true
}

extension Array {
    mutating func permutate(_ n: Int, _ k: Int, _ c: ([Element]) -> Void) {
        if n == k {
            c(self)
        }

        for i in k..<n {
            self.swapAt(i, k)
            self.permutate(n, k+1, c)
            self.swapAt(i, k)
        }
    }
}

func solution(_ numbers:String) -> Int {
    var primes: Set<Int> = Set()
    var nums = Array(numbers)

    nums.permutate(nums.count, 0) {

        for i in 1...$0.count {
            let sub = $0[0..<i]

            if let n = Int(String(sub)) {

                if isPrime(n) {
                    primes.insert(n)
                }
            }
        }
    }

    return primes.count
}

solution("107")
