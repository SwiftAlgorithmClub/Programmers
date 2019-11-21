// MARK: - 모의고사
struct Person{
    var name: Int
    var score: Int
    var regex: [Int]
}

func solution(_ answers:[Int]) -> [Int] {

    var resultArray: [Int] = []

    var persons: [Person] = [
        .init(name: 1, score: 0, regex: [1,2,3,4,5]),
        .init(name: 2, score: 0, regex: [2,1,2,3,2,4,2,5]),
        .init(name: 3, score: 0, regex: [3,3,1,1,2,2,4,4,5,5])
    ]

    for i in 0 ..< answers.count{
        let answer = answers[i]
        var firstPerson = persons[0]
        var secondPerson = persons[1]
        var thirdPerson = persons[2]

        if firstPerson.regex[i % 5] == answer {
            firstPerson.score += 1
            persons[0] = firstPerson
        }

        if secondPerson.regex[i % 8] == answer {
            secondPerson.score += 1
            persons[1] = secondPerson
        }
        if thirdPerson.regex[i % 10] == answer {
            thirdPerson.score += 1
            persons[2] = thirdPerson
        }
    }

    let max = persons
        .map { $0.score }
        .max()

    guard let maxValue = max,
        maxValue > 0 else { return resultArray }

    for i in 0 ..< persons.count{
        if persons[i].score == maxValue{
            resultArray.append(persons[i].name)
        }
    }
    return resultArray.sorted()
}

print(solution([1,3,2,4,2]))
