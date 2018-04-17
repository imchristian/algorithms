// Binary Search Tree Algorithm Example

import Foundation

//generic binary search tree node
class BSNode<T> {
    var key: T?
    var left: BSNode?
    var right: BSNode?
    var height: Int?
}

class BSTree<T: Comparable> {
    var root = BSNode<T>()
    
    func append(element key: T) {
        //initialize root
        guard root.key != nil else {
            root.key = key
            return
        }
        
        //set initial indicator
        var current: BSNode<T> = root
        
        while current.key != nil {
            //check left side
            if key < current.key! {
                if current.left != nil {
                    current = current.left!
                } else {
                    //create new element
                    let childToAdd = BSNode<T>()
                    childToAdd.key = key
                    current.left = childToAdd
                    break
                }
            }
            
            //check right side
            if key > current.key! {
                if current.right != nil {
                    current = current.right!
                }
                else {
                    //create new element
                    let childToAdd = BSNode<T>()
                    childToAdd.key = key
                    current.right = childToAdd
                    break
                }
            }
        }
    }
    
    //equality test - O(log n)
    func contains(_ key: T) -> Bool {
        var current: BSNode<T>? = root
        
        while current != nil {
            guard let testkey = current?.key else {
                return false
            }
            
            //test match
            if testkey == key {
                return true
            }
            
            //check left side
            if key < testkey {
                if current?.left != nil {
                    current = current?.left
                    continue
                } else {
                    return false
                }
            }
            
            //check right side
            if key > testkey {
                if current?.right != nil {
                    current = current?.right
                    continue
                } else {
                    return false
                }
            }
        }
        return false
    }
    
    private func findHeight(of element: BSNode<T>?) -> Int {
        //check empty leaves
        guard let bsNode = element else {
            return -1
        }
        return bsNode.height!
    }
    
    private func setHeight(for element: BSNode<T>) {
        //set leaf variables
        var elementHeight: Int = 0
        
        //do comparison and calculate heigh
        elementHeight = max(findHeight(of: element.left), findHeight(of: element.right)) + 1
        
        element.height = elementHeight
    }
    
    func isTreeBalanced(for element: BSNode<T>?) -> Bool {
        guard element?.key != nil else {
            print("no element provided...")
            return false
        }
        
        //use absolute value to manage right and left imbalances
        if (abs(findHeight(of: element?.left) - findHeight(of: element?.right)) <= 1) {
            return true
        } else {
            return false
        }
    }
    
    //perform left or right rotation
    private func rotate(element: BSNode<T>) {
        //create new element
        let childToUse = BSNode<T>()
        childToUse.height = 0
        childToUse.key = element.key
        
        //determine side imbalance
        let rightSide = findHeight(of: element.left) - findHeight(of: element.right)
        let leftSide = findHeight(of: element.right) - findHeight(of: element.left)
        
        if rightSide > 1 {
            //reset the root node
            element.key = element.left?.key
            element.height = findHeight(of: element.left)
            
            //assign the new right node
            element.right = childToUse
            
            //adjust the left node
            element.left = element.left?.left
            element.left?.height = 0
        }
        
    }
}


//simple array of unsorted integers
let numberList: Array<Int> = [29, 26, 23]

//create a new BST instance
var bstree = BSTree<Int>()

//sort each item in the list
for number in numberList {
    bstree.append(element: number)
}









