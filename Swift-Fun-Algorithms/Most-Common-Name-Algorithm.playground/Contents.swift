/*  Most Common Name Algorithm
    Given an array of names, print the name that have
    most occurrences
 */

func mostCommonNameInArray(array: [String]) -> String {
    // We are going to store here the names as the keys
    // and the value is the number of occurrences
    var nameCounDictionary = [String : Int]()
    
    for name in array {
        if let count = nameCounDictionary[name] {
            nameCounDictionary[name] = count + 1
        } else {
            nameCounDictionary[name] = 1
        }
    }
    
    // Here we are going to iterate the keys and check:
    // if it is the first key we simple store it, or check
    // if the current stored as the mostCommons key has more
    // occurrences than the curren iterated key 
    var mostCommonName = ""
    
    for key in nameCounDictionary.keys {
        if mostCommonName == "" {
            mostCommonName = key
        } else {
            let count = nameCounDictionary[key]
            if count! > nameCounDictionary[mostCommonName]! {
                mostCommonName = key
            }
        }
    }
    return mostCommonName
}

mostCommonNameInArray(array: ["Bob", "Sally", "Bob", "Sam", "Michael"])
