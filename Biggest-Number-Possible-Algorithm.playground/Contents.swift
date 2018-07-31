// Given a certain number re arranged the digits to return
// the biggest number possible

import Foundation

public func biggestNumberPossible(number: Int) -> Int {
    let stringNumberOrdered = String(number).sorted(by: >)
    
    return Int(String(stringNumberOrdered))!
}

print(biggestNumberPossible(number: 1234))
