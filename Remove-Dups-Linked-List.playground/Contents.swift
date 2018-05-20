/*
 * Remove Dups - Linked List Algorithm
 * Write code to remove duplicates from an unsorted linked list
 *
 */

import Foundation

// Doubly linked list struture
class LLNode<T> {
    var key: T?
    var next: LLNode?
    var previous: LLNode?
}

func deleteDups(head: LLNode<String>) {
    var current = head
    while current != nil {
        // Remove all future nodes that have the same value
        var runner = current
        while runner.next != nil {
            if (runner.next?.key == current.key) {
                runner.next = runner.next?.next
            } else {
                runner = runner.next!
            }
        }
        current = current.next!
    }
}

// This code runs in O(1) space, but O(n2)
