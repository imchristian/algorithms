/*
 write a function to identify the largest count of consecutive "1's" in the sequence. e.g. 111000011011 -> 3
 */

func longestSequence(of key: String, list: String) -> Int {
    // initial values
    var current: String
    var counter: Int = 0
    var longest: Int = 0
    
    // iterate trough list - O(n)
    for s in list {
        //current iteration
        current = String(s)
        
        if current == key {
            counter += 1
        } else {
            counter = 0
        }
        
        // preserve the longest sequence
        if counter >= longest {
            longest = counter
        }
    }
    
    // return count results
    return longest
}

longestSequence(of: "1", list: "11100011011")
