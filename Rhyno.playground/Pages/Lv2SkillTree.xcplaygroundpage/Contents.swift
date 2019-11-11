import Foundation

func solution(_ skill:String, _ skill_trees:[String]) -> Int {
    var result = 0

    for tree in skill_trees {

        var index = skill.startIndex
        var isValid = true
        for c in tree {
            if skill.contains(c) {
                if index != skill.endIndex, skill[index] == c {
                    index = skill.index(after: index)
                } else {
                    isValid = false
                    break
                }
            }
        }

        if isValid {
            result += 1
        }
    }

    return result
}
