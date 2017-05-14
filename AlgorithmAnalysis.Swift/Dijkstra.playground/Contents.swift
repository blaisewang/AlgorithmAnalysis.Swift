//:# Dijkstra's Algorithm
///
/// To find the shortest paths between nodes in a graph.
///

typealias edge = (Character, Character)
typealias weightedEdge = (edge, UInt)

extension Collection where Iterator.Element == weightedEdge, SubSequence.Iterator.Element == Iterator.Element {
    func shortestPaths(sourceNode source: Character) -> [([Character], UInt)] {
        var distanceDict = Dictionary<Character, UInt>()
        var previousDict = Dictionary<Character, Character>()
        var shortestDistance = [([Character], UInt)]()
        forEach {
            distanceDict.updateValue(UInt.max, forKey: $0.0.0)
            distanceDict.updateValue(UInt.max, forKey: $0.0.1)
        }
        distanceDict[source] = 0
        
        while distanceDict.count > 0 {
            guard let minDistance = distanceDict.min(by: { $0.0.value < $0.1.value }) else {
                break
            }
            forEach { weightedEdge in
                if weightedEdge.0.0 == minDistance.key {
                    if let neighborDistance = distanceDict[weightedEdge.0.1] {
                        let alt = weightedEdge.1 + minDistance.value
                        if alt < neighborDistance {
                            distanceDict.updateValue(alt, forKey: weightedEdge.0.1)
                            previousDict.updateValue(weightedEdge.0.0, forKey: weightedEdge.0.1)
                        }
                    }
                }
            }
            
            var path: [Character] = [source]
            var node = minDistance.key
            while let previousNode = previousDict[node] {
                path.insert(node, at: 1)
                node = previousNode
            }
            shortestDistance.append(([], minDistance.value))
            distanceDict.removeValue(forKey: minDistance.key)
        }
        
        return shortestDistance
    }
}

var graph: [weightedEdge] = [(("s", "t"), 10),
                             (("s", "y"), 5),
                             (("t", "x"), 1),
                             (("t", "y"), 2),
                             (("x", "z"), 4),
                             (("y", "t"), 3),
                             (("y", "x"), 9),
                             (("y", "z"), 2),
                             (("z", "s"), 7),
                             (("z", "x"), 6)]
print(graph.shortestPaths(sourceNode: "s"))


