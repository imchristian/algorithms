/*
 * Ransom Note Algorithm
 * Given the words in a magazine and the words in a ransom note, print Yes if we can
 * replicate the ransom note exactly using whole words from the magazine or print No
 *
 */

import Foundation

func canBuildTheRansomNote() -> String {
    let magazineWords = ["two","times","three","is","not","four"]
    let ransomNoteWords = ["two","times","two","is","four"]
    
    var dictOfWordsInMagazine = [String: Int]()
    
    for i in 0..<magazineWords.count {
        if (dictOfWordsInMagazine[magazineWords[i]] != nil) {
            let newValue = dictOfWordsInMagazine[magazineWords[i]]! + 1
            dictOfWordsInMagazine.updateValue(newValue, forKey: magazineWords[i])
        } else {
            dictOfWordsInMagazine.updateValue(1, forKey: magazineWords[i])
        }
    }
    
    for i in 0..<ransomNoteWords.count {
        if (dictOfWordsInMagazine[ransomNoteWords[i]] != nil) {
            let newValue = dictOfWordsInMagazine[ransomNoteWords[i]]! - 1
            dictOfWordsInMagazine.updateValue(newValue, forKey: ransomNoteWords[i])
            if (dictOfWordsInMagazine[ransomNoteWords[i]]! < 0) {
                return "No"
            }
        }
    }
    
    
    return "Yes"
}

print(canBuildTheRansomNote())
