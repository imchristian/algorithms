// Graph Algorithm Example

import Foundation

public class Vertex {
    var key: String?
    var neighbors: Array<Edge>
    
    init() {
        self.neighbors = Array<Edge>()
    }
}

public class Edge {
    var neighbor: Vertex
    var weight: Int
    
    init() {
        weight = 0
        self.neighbor = Vertex()
    }
}

public class SwiftGraph {
    //declare graph canvas
    private var canvas: Array<Vertex>
    public var isDirected: Bool
    
    init() {
        canvas = Array<Vertex>()
        isDirected = true
    }
    
    //create a new vertex
    func addVertex(key: String) -> Vertex {
        //set the key
        let childVertex: Vertex = Vertex()
        childVertex.key = key
        
        //add the vertex to the graph canvas
        canvas.append(childVertex)
        
        return childVertex
    }
    
    //add edge to source vertex
    func addEdge(source: Vertex, neighbor: Vertex, weight: Int) {
        //new edge
        let newEdge = Edge()
        
        //establish default properties
        newEdge.neighbor = neighbor
        newEdge.weight = weight
        source.neighbors.append(newEdge)
        
        //check condition for an undirected graph
        if isDirected == false {
            //create a new reversed edge
            let reverseEdge = Edge()
            
            //establish the reversed properties
            reverseEdge.neighbor = source
            reverseEdge.weight = weight
            neighbor.neighbors.append(reverseEdge)
        }
    }
    
}

















