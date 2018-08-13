/*
 Write a function for finding the index of the "rotation point,"
 which is where I started working from the beginning of the dictionary.
 
 var words = [
 "ptolemaic",
 "retrograde",
 "supplant",
 "undulate",
 "xenoepist",
 "asymptote",  // <-- rotates here!
 "babka",
 "banoffee",
 "engender",
 "karpatka",
 "othellolagkage",
 ]
 */

import Foundation

public func findRotationPoint(in words: [String]) -> Int {
    let firstWord = words[0]
    
    var floorIndex = 0
    var ceilingIndex = words.count - 1
    
    while floorIndex < ceilingIndex {
        
        // guess a point halfway between floor and ceiling
        let guessIndex = floorIndex + ((ceilingIndex - floorIndex) / 2)
        
        // if guess comes after first word or is the first word
        if words[guessIndex] >= firstWord {
            // go right
            floorIndex = guessIndex
        } else {
            // go left
            ceilingIndex = guessIndex
        }
        
        // if floor and ceiling have converged
        if (floorIndex + 1) == ceilingIndex {
            
            // between floor and ceiling is where we flipped to the beginning
            // so ceiling is alphabetically first
            break
        }
        
    }
    return ceilingIndex
}
