/*
 * One Away Algorithm
 * Given two strings check if they are one edit (or zero edits) away.
 *
 * Examples:
 * pale, ple -> true
 * pales, pale -> true
 * pale, bale -> true
 * pale, bake -> false
 *
 */

func isOneEditAway(first: String, second: String) -> Bool {
    
    func oneEditReplace(s1: String, s2: String) -> Bool {
        var foundDifference = false
        for i in 0..<s1.count {
            let indexS1 = s1.index(s1.startIndex, offsetBy: i)
            let indexS2 = s2.index(s2.startIndex, offsetBy: i)
            if (s1[indexS1] != s2[indexS2]) {
                if (foundDifference) {
                    return false
                }
                foundDifference = true
            }
        }
        return true
    }
    
    // Check if you can insert a character into s1 to make s2
    func oneEditInsert(s1: String, s2: String) -> Bool {
        var index1 = 0
        var index2 = 0
        while (index2 < s2.count && index1 < s1.count) {
            let indexS1 = s1.index(s1.startIndex, offsetBy: index1)
            let indexS2 = s2.index(s2.startIndex, offsetBy: index2)
            if (s1[indexS1] != s2[indexS2]) {
                if (index1 != index2) {
                    return false
                }
                index2 += 1
            } else {
                index1 += 1
                index2 += 1
            }
        }
        return true
    }
    
    if (first.count == second.count) { // Verify this type of case: (pale, bake)
        return oneEditReplace(s1: first, s2: second)
    } else if (first.count + 1 == second.count) { // Verify this type of case: (pale, ple)
        return oneEditInsert(s1: first, s2: second)
    } else if (first.count - 1 == second.count) { // Verify this type of case: (pale, pales)
        return oneEditInsert(s1: second, s2: first)
    }
    
    return false
}

isOneEditAway(first: "pale", second: "ple")
