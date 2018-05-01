/*
 * Palindrome Permutation Algorithm
 * Given one string we can determine if it is a palindrome permutation or not
 * if just one of the chacters has an odd count
 */

import Foundation

/*
 * We use a hash table to count how many times each
 * character appears. Then, we iterate through the hash
 * table and ensure that no more than one character has an odd count
 */
func isPermutationOfPalindrome(phrase: String) -> Bool {
    var list = Array<Int>(repeatElement(0, count: 128))
    
    // Map characters to the hash table and count how many occurrences has
    for scalar in phrase.unicodeScalars {
        let unicode = Int(scalar.value)
        list[unicode] += 1
    }
    
    // Check if we only have one char with odd count
    var oddValueFound = false
    for i in 0..<list.count {
        if (list[i] % 2 == 1) {
            if (oddValueFound) {
                return false
            }
            oddValueFound = true
        }
    }
    
    return true
}

isPermutationOfPalindrome(phrase: "tactcoapapa")
