//:# Matrix Multiplication Algorithm

///
/// To find all pairs shortest paths in a weighted graph with positive or negative edge weights
/// (but with no negative cycles)
///
///

typealias edge = (UInt, UInt)
typealias weightedEdge = (edge, Int)

extension Collection where Iterator.Element == weightedEdge, SubSequence.Iterator.Element == Iterator.Element {
    func specialMatrixMultiply(matrix m:[[Int]]) -> [[Int]] {
        var c = (0..<m.count).map { _ in
            (0..<m.count).map { _ in
                Int.max
            }
        }
        for i in 0..<m.count {
            for j in 0..<m.count {
                for k in 0..<m.count {
                    if (m[i][k] != Int.max && m[k][j] != Int.max) {
                        if c[i][j] > m[i][k] + m[k][j] {
                            c[i][j] = m[i][k] + m[k][j]
                        }
                    }
                }
            }
        }
        return c
    }
    
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
        var w = (0..<vertexSet.count).map { row in
            (0..<vertexSet.count).map { column in
                row == column ? 0 : Int.max
            }
        }
        forEach {
            if let row = vertexes.index(of: $0.0.0), let column = vertexes.index(of: $0.0.1) {
                w[row][column] = $0.1
            }
        }
        
        var m = 1
        while m < vertexSet.count {
            w = specialMatrixMultiply(matrix: w)
            m *= 2
        }
        
        vertexes.forEach { u in
            var shortestDistance = [weightedEdge]()
            vertexes.forEach { v in
                if let row = vertexes.index(of: u), let column = vertexes.index(of: v) {
                    shortestDistance.append(((u , v), w[row][column]))
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


