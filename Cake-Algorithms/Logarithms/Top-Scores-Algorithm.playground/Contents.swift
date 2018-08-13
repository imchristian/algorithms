/*
 Write a function that takes:
 
 an array of unsortedScores
 the highestPossibleScore in the game
 and returns a sorted array of scores in less than O(n log n) time.
 */

func sortScores(_ unsortedScores: [Int], withHighest highestPossibleScore: Int) -> [Int] {

    // array of 0s at indices 0..highestPossibleScore
    var scoreCounts = Array(repeating: 0, count: highestPossibleScore + 1)

    // populate scoreCounts
    for score in unsortedScores {
        scoreCounts[score] += 1
    }

    // populate the final sorted array
    var sortedScores: [Int] = []

    // for each item in scoreCounts
    for score in (0...highestPossibleScore).reversed() {
        let count = scoreCounts[score]
        
        // for the number of times the item occurs
        for _ in 0..<count {
            
            // add it to the sorted array
            sortedScores.append(score)
        }
    }

    return sortedScores
}
