/*
 * Palindrome Permutation Algorithm
 * Given one string we can determine if it is a palindrome permutation or not
 * if just one of the chacters has an odd count
 */

import Foundation

func isPermutationOfPalindrome(phrase: String) -> Bool {
    var dict = [String : Int]()
    
    // Map character to the hast table and conut how many occurrences has
    for s in phrase {
        if (dict[String(s)] != nil) {
            let newValue = dict[String(s)]! + 1
            dict.updateValue(newValue, forKey: String(s))
        } else {
            dict.updateValue(1, forKey: String(s))
        }
    }
    
    // Check if we only have one char with odd count
    var oddValueFound = false
    for occurrences in dict.values {
        if (occurrences % 2 == 1) {
            if (oddValueFound) {
                return false
            }
            oddValueFound = true
        }
    }
    
    return true
}
