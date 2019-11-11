import Foundation

func solution(_ w:Int, _ h:Int) -> Int64{
    var answer:Int = 0

    var quotient = 0

    for i in 1...h {
        let qr = (i*w).quotientAndRemainder(dividingBy: h)

        answer += qr.quotient - quotient
        answer += qr.remainder == 0 ? 0 : 1

        quotient = qr.quotient
    }

    return Int64(w*h-answer)
}
solution(8, 12)


/* 아주 효율적인 방법. 아직 이해 못함
 import Foundation

 func gcd(_ a: Int, _ b: Int) -> Int {
     return b != 0 ? gcd(b, a % b) : a
 }

 func solution(_ w:Int, _ h:Int) -> Int64{
     var answer:Int = w * h

     let g = gcd(w,h)

     let w = w / g
     let h = h / g

     return Int64(answer - (w + h - 1) * g)
 }
 */
