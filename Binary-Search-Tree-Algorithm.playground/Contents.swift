// Binary Search Tree Algorithm Example

import Foundation

//generic binary search tree node
class BSNode<T> {
    var key: T?
    var left: BSNode?
    var right: BSNode?
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
}


//simple array of unsorted integers
let numberList: Array<Int> = [8, 2, 10, 9, 11, 1, 7]

//create a new BST instance
var bstree = BSTree<Int>()

//sort each item in the list
for number in numberList {
    bstree.append(element: number)
}







