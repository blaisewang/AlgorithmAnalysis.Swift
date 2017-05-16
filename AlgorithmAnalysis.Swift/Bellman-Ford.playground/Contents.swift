//:# Bellman–Ford algorithm

/// 
/// Computes shortest paths from a single source vertex to all of the other vertices 
/// in a weighted digraph.
///

typealias edge = (Character, Character)
typealias weightedEdge = (edge, Int)

extension Collection where Iterator.Element == weightedEdge, SubSequence.Iterator.Element == Iterator.Element {
    func shortestPaths(sourceNode source: Character) -> [([Character], Int)] {
        var hasNegativeCycle = false
        var distanceDict = Dictionary<Character, Int>()
        var previousDict = Dictionary<Character, Character>()
        var shortestDistance = [([Character], Int)]()
        forEach {
            distanceDict.updateValue(Int.max, forKey: $0.0.0)
            distanceDict.updateValue(Int.max, forKey: $0.0.1)
        }
        guard let _ = distanceDict[source] else {
            return []
        }
        distanceDict[source] = 0
        
        for _ in 0..<distanceDict.count - 1 {
            forEach({ weightedEdge in
                if let u = distanceDict[weightedEdge.0.0], let v = distanceDict[weightedEdge.0.1] {
                    if u + weightedEdge.1 < v {
                        distanceDict.updateValue(u + weightedEdge.1, forKey: weightedEdge.0.1)
                        previousDict.updateValue(weightedEdge.0.0, forKey: weightedEdge.0.1)
                    }
                }
            })
        }
        
        forEach({ weightedEdge in
            if let u = distanceDict[weightedEdge.0.0], let v = distanceDict[weightedEdge.0.1] {
                if u + weightedEdge.1 < v {
                    hasNegativeCycle = true
                }
            }
        })
        guard !hasNegativeCycle else {
            return []
        }
        
        distanceDict.forEach { distance in
            var path: [Character] = [source]
            var node = distance.key
            while let previousNode = previousDict[node] {
                path.insert(node, at: 1)
                node = previousNode
            }
            shortestDistance.append((path, distance.value))
            distanceDict.removeValue(forKey: distance.key)
        }
        return shortestDistance
    }
}

var graph: [weightedEdge] = [(("s", "t"), 6),
                             (("s", "y"), 7),
                             (("t", "x"), 5),
                             (("t", "y"), 8),
                             (("t", "z"), -4),
                             (("x", "t"), -2),
                             (("y", "x"), -3),
                             (("y", "z"), 9),
                             (("z", "s"), 2),
                             (("z", "x"), 7)]
print(graph.shortestPaths(sourceNode: "s"))


