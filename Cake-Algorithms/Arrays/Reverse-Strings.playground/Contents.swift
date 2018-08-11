  func reverse(_ str: inout String) {
    
    var leftIndex = 0
    var rightIndex = str.characters.count - 1
    
    while leftIndex < rightIndex {
        
        // Swap characters
        let leftStrIndex = str.index(str.startIndex, offsetBy: leftIndex)
        let rightStrIndex = str.index(str.startIndex, offsetBy: rightIndex)
        
        let leftChar = str[leftStrIndex]
        let rightChar = str[rightStrIndex]
        
        let leftRange = leftStrIndex...leftStrIndex
        let rightRange = rightStrIndex...rightStrIndex
        
        str.replaceSubrange(leftRange, with: String(rightChar))
        str.replaceSubrange(rightRange, with: String(leftChar))
        
        // Move towards middle
        leftIndex += 1
        rightIndex -= 1
    }
  }
