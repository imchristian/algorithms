/*
 Say you have an array for which the i element is the price of a given stock on day i.
 Design an algorithm to find the maximun profit.
 You may complete as many transactions as you like.
 
 Note: You may not engage in multiple transactions at the same time.
 You must sell the stock before you buy again.
 
 Example:
 Input: [7,1,5,3,6,4]
 Output: 7
 Explanation: Buy on day 2 (price = 1) and sell on day 3 (price = 5).
 Then buy on day 4 (price = 3) and sell on day 5 (price = 6)
 */

import Foundation

func maxProfit(_ prices: [Int]) -> Int {
    guard prices.count > 1 else {
        return 0
    }
    
    var maxProfit = 0
    
    for i in 1..<prices.count {
        let profit = prices[i] - prices[i-1]
        
        if profit > 0 {
            maxProfit += profit
        }
    }
    
    return maxProfit
}
