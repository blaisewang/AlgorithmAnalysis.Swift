//:# Floyd–Warshall Algorithm

///
/// To find all pairs shortest paths in a weighted graph with positive or negative edge weights
/// (but with no negative cycles)
///

typealias edge = (UInt, UInt)
typealias weightedEdge = (edge, Int)

extension Collection where Iterator.Element == weightedEdge, SubSequence.Iterator.Element == Iterator.Element {
    var allPairsShortestPaths: String {
        var description = ""
        guard count > 0 else {
            return description
        }
        var vertexSet = Set<UInt>()
        var vertexes = [UInt]()
        forEach {
            vertexSet.insert($0.0.0)
            vertexSet.insert($0.0.1)
        }
        vertexes = vertexSet.sorted()
        var distance = (0..<vertexSet.count).map { row in
            (0..<vertexSet.count).map { column in
                row == column ? 0 : Int.max
            }
        }
        var next = (0..<vertexSet.count).map { row in
            (0..<vertexSet.count).map { column in
                -1
            }
        }
        forEach {
            if let row = vertexes.index(of: $0.0.0), let column = vertexes.index(of: $0.0.1) {
                distance[row][column] = $0.1
                next[row][column] = column
            }
        }
        
        for k in 0..<vertexSet.count {
            for i in 0..<vertexSet.count {
                for j in 0..<vertexSet.count {
                    if (distance[i][k] != Int.max && distance[k][j] != Int.max) {
                        if distance[i][j] > distance[i][k] + distance[k][j] {
                            distance[i][j] = distance[i][k] + distance[k][j]
                            next[i][j] = next[i][k]
                        }
                    }
                }
            }
        }
        
        vertexes.forEach { u in
            var shortestDistance = [([UInt], Int)]()
            vertexes.forEach { v in
                guard let rowIndex = vertexes.index(of: u) else {
                    return
                }
                var u = u
                var path = [UInt]()
                if var row = vertexes.index(of: u), let column = vertexes.index(of: v) {
                    path.append(u)
                    if next[row][column] != -1 {
                        while u != v {
                            u = vertexes[next[row][column]]
                            row = vertexes.index(of: u)!
                            path.append(u)
                        }
                    }
                    shortestDistance.append((path, distance[rowIndex][column]))
                }
            }
            description += shortestDistance.description + "\n"
        }
        
        return description
    }
}

var graph: [weightedEdge] = [((1, 2), 3),
                             ((1, 3), 8),
                             ((1, 5), -4),
                             ((2, 4), 1),
                             ((2, 5), 7),
                             ((3, 2), 4),
                             ((4, 1), 2),
                             ((4, 3), -5),
                             ((5, 4), 6)]
print(graph.allPairsShortestPaths)


