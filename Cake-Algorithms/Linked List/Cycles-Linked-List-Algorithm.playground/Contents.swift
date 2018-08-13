/*
 Detect a cylce in a linked list.
 Note that the head pointer may be 'null' if the list is empty.
 */

// A Node is defined as:
class Node {
    var key: Any?
    var next: Node?
}

func hasCycle(head: Node?) -> Bool {
    if (head == nil) {
        return false
    }
    
    var fast = head!.next
    var slow = head
    while (fast != nil && fast?.next != nil && slow != nil) {
        if (fast == slow) {
            return true
        }
        fast = fast?.next?.next
        slow = slow?.next
    }
    return false
}
