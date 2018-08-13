/*
 Write a function to see if a binary tree is "superbalanced"
 (a new tree property we just made up).
 
 A tree is "superbalanced" if the difference between the depths of any two leaf nodes
 is no greater than one.
 */

class BinaryTreeNode {
    
    var value: Int
    var left: BinaryTreeNode?
    var right: BinaryTreeNode?
    
    init(_ value: Int) {
        self.value = value
    }
    
    func insert(leftValue: Int) -> BinaryTreeNode {
        let left = BinaryTreeNode(leftValue)
        self.left = left
        return left
    }
    
    func insert(rightValue: Int) -> BinaryTreeNode {
        let right = BinaryTreeNode(rightValue)
        self.right = right
        return right
    }
}

/*
 We do a depth-first walk through our tree, keeping track of the depth as we go.
 When we find a leaf, we add its depth to an array of depths if we haven't seen that depth already.
 
 Each time we hit a leaf with a new depth, there are two ways that our tree might now be unbalanced:
 
 There are more than 2 different leaf depths
 There are exactly 2 leaf depths and they are more than 1 apart.
 */
class NodeDepthPair {
    let node: BinaryTreeNode
    let depth: Int
    
    init(node: BinaryTreeNode, depth: Int) {
        self.node = node
        self.depth = depth
    }
}

func isBalanced(treeRoot: BinaryTreeNode) -> Bool {
    var depths: [Int] = [] // we short-circuit as soon as we find more that 2
    
    // nodes will store pairs of a node and the node's depth
    var nodes: [NodeDepthPair] = []
    nodes.append(NodeDepthPair(node: treeRoot, depth: 0))
    
    while !nodes.isEmpty {
        // pop a node and its depth from the top of our stack
        let nodeDepthPair = nodes.removeLast()
        let node = nodeDepthPair.node
        let depth = nodeDepthPair.depth
        
        // case: we found a leaf
        if node.left == nil && node.right == nil {
            
            // we only care if it's a new depth
            if !depths.contains(depth) {
                depths.append(depth)
                
                // two ways we might now have an unbalanced tree:
                //   1) more than 2 different leaf depths
                //   2) 2 leaf depths that are more than 1 apart
                if depths.count > 2 ||
                    (depths.count == 2 && abs(depths[0] - depths[1]) > 1) {
                    return false
                }
            }
            
            // case: this isn't a leaf - keep stepping down
        } else {
            if let left = node.left {
                nodes.append(NodeDepthPair(node: left, depth: depth + 1))
            }
            if let right = node.right {
                nodes.append(NodeDepthPair(node: right, depth: depth + 1))
            }
        }
    }
    
    return true
}





















