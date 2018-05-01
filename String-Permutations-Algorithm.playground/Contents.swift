/*
 * Strings Permutation Algorithm
 * Given two string determine if they are permutation or not
 */

func permutations(s: String, t: String) -> Bool {
    // Check for the trivial case
    if (s.count != t.count) {
        return false
    }
    
    var list = Array<Int>(repeatElement(0, count: 128)) // Assumption: ASCII
    for scalar in s.unicodeScalars {
        let unicode = Int(scalar.value)
        list[unicode] += 1
    }
    
    for scalar in t.unicodeScalars {
        let unicode = Int(scalar.value)
        list[unicode] -= 1
        if (list[unicode] < 0) {
            return false
        }
    }
    
    return true // letters has no neg values, and therefore no pos values either
}

permutations(s: "asd", t: "asd")
