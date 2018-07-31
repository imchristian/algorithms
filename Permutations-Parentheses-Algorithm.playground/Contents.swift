// Print all posible n pairs of balanced parentheses
// example: n = 2 then (()), ()

import Foundation

var results: [String] = []

public func parenthesesCombinations(n: Int) {
    return buildParenthesesCombinations(leftSide: n, rightSide: n)
}

private func buildParenthesesCombinations(leftSide: Int, rightSide: Int) {
    let n = leftSide
    if leftSide == 0 && rightSide == 0 {
        print(results)
    }
    
    // pos is the next position we should insert parentheses
    let pos = (n * 2) - leftSide - rightSide
    
    if leftSide > 0 {
        results[pos] = "("
        buildParenthesesCombinations(leftSide: leftSide - 1, rightSide: rightSide)
    }
    
    if leftSide < rightSide {
        results[pos] = ")"
        buildParenthesesCombinations(leftSide: leftSide, rightSide: rightSide - 1)
    }
}
