// Linked List Example

import Foundation

// linked list struture
class LLNode<T> {
    var key: T?
    var next: LLNode?
    var previous: LLNode?
}

public class LinkedList<T: Equatable> {
    //new instance
    private var head = LLNode<T>()
    var counter = 0
    
    func append(element key: T) {
        guard head.key != nil else {
            head.key = key
            return
        }
        
        var current: LLNode? = head
        
        //position node
        while current != nil {
            if current?.next == nil {
                let childToUse = LLNode<T>()
                
                childToUse.key = key
                childToUse.previous = current
                current!.next = childToUse
                break
            } else {
                current = current?.next
            }
        }
    }
    
    func remove(at index: Int) {
        //check empty conditions
        if ((index < 0) || (head.key == nil)) {
            print("link index does not exist..")
            return
        }
        
        var current: LLNode<T>? = head
        var trailer: LLNode<T>?
        var listIndex: Int = 0
        
        //determine if the removal is at the heaad
        if (index == 0) {
            current = current?.next
            
            if let headitem = current {
                head = headitem
                counter -= 1
            }
            return
        }
        
        //iterate through remaining items
        while current != nil {
            if  listIndex == index {
                //redirect the trailer and next pointers
                trailer!.next = current?.next
                current = nil
                break
            }
            
            //update assigments
            trailer = current
            current = current?.next
            listIndex += 1
        }
    }
    
    //obtain link at a specific index
    func find(at index: Int) -> LLNode<T>? {
        //check empty conditions
        if ((index < 0) || (head.key == nil)) {
            return nil
        } else {
            var current: LLNode<T> = head
            var x: Int = 0
            
            //cycle through elements
            while index != x {
                current = current.next!
                x += 1
            }
            return current
        }
    }
}















