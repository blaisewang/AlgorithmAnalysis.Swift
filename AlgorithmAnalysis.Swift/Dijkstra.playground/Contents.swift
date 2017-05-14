//:# Dijkstra's Algorithm
///
/// To find the shortest paths between nodes in a graph.
///

typealias edge = (Character, Character)
typealias weightedEdge = (edge, UInt)

extension Collection where Iterator.Element == weightedEdge, SubSequence.Iterator.Element == Iterator.Element {
    func shortestPaths(sourcea source: Character) -> [weightedEdge] {
        var distanceDict = Dictionary<Character, UInt>()
        var shortestDistance = [weightedEdge]()
        forEach {
            distanceDict.updateValue(UInt.max, forKey: $0.0.0)
            distanceDict.updateValue(UInt.max, forKey: $0.0.1)
        }
        distanceDict[source] = 0
        
        while distanceDict.count > 0 {
            guard let minDistance = distanceDict.min(by: { $0.0.value < $0.1.value }) else {
                break
            }
            forEach { anEdge in
                if anEdge.0.0 == minDistance.key {
                    if let neighborDistance = distanceDict[anEdge.0.1]  {
                        let alt = anEdge.1 + minDistance.value
                        if alt < neighborDistance {
                            distanceDict.updateValue(alt, forKey: anEdge.0.1)
                        }
                    }
 
                }
            }
            shortestDistance.append(((source, minDistance.key), minDistance.value))
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
print(graph.shortestPaths(sourcea: "s"))



