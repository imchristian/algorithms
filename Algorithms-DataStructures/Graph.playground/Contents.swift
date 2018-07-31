public enum EdgeType {
    case directed
    case undirected
}

// This protocol describes the common operations for a graph
public protocol Graph {
    associatedtype Element
    
    // Creates a vertex and adds it to the graph
    func createVertex(data: Element) -> Vertex<Element>
    
    // Adds a directed edge between to vertices
    func addDirectEdge(from source: Vertex<Element>,
                       to destination: Vertex<Element>,
                       weight: Double?)
    
    // Adds an undirected (or bidirectional) edge between to vertices
    func addUndirectedEdge(between source: Vertex<Element>,
                           and destination: Vertex<Element>,
                           weight: Double?)
    
    // Uses the EdgeType enum to add either a directed or undirected
    // edge between two vertices
    func add(_ edge: EdgeType, from source: Vertex<Element>,
             to destination: Vertex<Element>, weight: Double?)
    
    // Returns a list of outgoing edges from a specific vertex
    func edges(from source: Vertex<Element>) -> [Edge<Elements>]
    
    // Returns the weight of the edge between two vertices
    func weight(from source: Vertex<Element>,
                to destination: Vertex<Element>) -> Double?
}
