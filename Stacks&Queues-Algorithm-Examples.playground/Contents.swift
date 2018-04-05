// Stacks & Queues Algorithms Examples

import Foundation

//generic node structure
class Node<T>{
    var key: T?
    var next: Node?
}

class Queue<T> {
    private var top: Node<T>?
    
    init() {
        top = Node<T>()
    }
    
    //enqueue the specified object
    func enQueue(_ key: T) {
        //trivial case
        guard top?.key != nil else {
            top?.key = key
            return
        }
        
        let childToUse = Node<T>()
        var current = top
        
        //cycle through the list
        while current?.next != nil {
            current = current?.next
        }
        
        //append new item
        childToUse.key = key
        current?.next = childToUse
    }
    
    //retrieve items - O(1) constant time
    func deQueue() -> T? {
        //determine key instance
        guard top?.key != nil else {
            return nil
        }
        
        //retrieve and queue the next item
        let queueItem: T? = top?.key
        
        //use optional binding
        if let nextItem = top?.next {
            top = nextItem
        } else {
            top = Node<T>()
        }
        return queueItem
    }
}

class Stack<T> {
    private var top: Node<T>
    private var counter: Int = 0
    
    init() {
        top = Node<T>()
    }
    
    //the number of items - O(1)
    var count: Int {
        return counter
    }
    
    //add item to the stack - O(1)
    func push(withKey key: T) {
        //return trivial case
        guard top.key != nil else {
            top.key = key
            counter += 1
            return
        }
        
        //create new item
        let childToUse = Node<T>()
        childToUse.key = key
        
        //set new created item at top
        childToUse.next = top
        top = childToUse
        
        //set counter
        counter += 1
        
        //remove item from the stack - O(1)
        func pop() {
            if self.count > 1 {
                top = top.next!
                
                //set counter
                counter -= 1
            } else {
                top.key = nil
                counter = 0
            }
        }
        
        //retrieve the top most item - O(1)
        func peek() -> Node<T> {
            return top
        }
        
        //check for value - O(1)
        func isEmpty() -> Bool {
            if self.count == 0 {
                return true
            } else {
                return false
            }
        }
    }
}













