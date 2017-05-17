//:# Minimum Spanning Tree
//:## with Prim's algorithm

/// To find a minimum spanning tree for a weighted undirected graph with Prim's algorithm.

typealias edge = (UInt, UInt)
typealias weightedEdge = (edge, UInt)

extension Collection where Iterator.Element == weightedEdge, SubSequence.Iterator.Element == Iterator.Element {
    var minimumSpanningTree: [weightedEdge] {
        var vertexes = Set<UInt>()
        var minimumSpanningTree = [weightedEdge]()
        let edges = sorted {
            $0.0.1 < $0.1.1
        }
        
        guard case let wEdge? = edges.first else {
            return []
        }
        forEach {
            vertexes.insert($0.0.0)
            vertexes.insert($0.0.1)
        }
        minimumSpanningTree.append(wEdge)
        
        vertexes.remove(wEdge.0.0)
        vertexes.remove(wEdge.0.1)
        while vertexes.count > 0 {
            for wEdge in edges {
                if (vertexes.contains(wEdge.0.0) && !vertexes.contains(wEdge.0.1)) || (!vertexes.contains(wEdge.0.0) && vertexes.contains(wEdge.0.1)) {
                    vertexes.remove(wEdge.0.0)
                    vertexes.remove(wEdge.0.1)
                    minimumSpanningTree.append(wEdge)
                    break
                }
            }
        }
        
        return minimumSpanningTree
    }
    
    var maxWeight: UInt {
        guard let max = self.max(by: { first, second -> Bool in
            return first.1 < second.1
        }) else {
            return 0
        }
        return max.1
    }
    
    var totalWeight: UInt {
        return reduce(0, { $0 + $1.1 })
    }
}

//var graph: [weightedEdge] = [((1, 2), 4),
//                             ((2, 3), 8),
//                             ((3, 4), 7),
//                             ((3, 6), 4),
//                             ((4, 5), 9),
//                             ((6, 7), 2),
//                             ((7, 8), 1),
//                             ((8, 9), 7),
//                             ((8, 1), 8),
//                             ((9, 3), 2),
//                             ((9, 7), 6),
//                             ((5, 6), 10),
//                             ((8, 2), 11),
//                             ((4, 6), 14)]
var graph: [weightedEdge] = [((1, 2), 28),
                             ((1, 6), 10),
                             ((2, 7), 14),
                             ((2, 3), 16),
                             ((6, 5), 25),
                             ((7, 5), 24),
                             ((7, 4), 18),
                             ((3, 4), 12),
                             ((5, 4), 22)]
var mst = graph.minimumSpanningTree
print(mst)
print(mst.maxWeight)
print(mst.totalWeight)


