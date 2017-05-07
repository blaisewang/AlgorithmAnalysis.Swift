//: # Fractional Knapsack Problem

/// Fractional Knapsack Problem
///
/// Fill a knapsack with fractional amounts of different materials chosen to maximize the value of the selected materials.

typealias Item = (Int, Double)

extension Collection where Iterator.Element == Item, SubSequence.Iterator.Element == Iterator.Element {
    func knapsackFilled(withCapacity capacity: UInt) -> [Item] {
        var cap = Int(capacity)
        var sortedItem = sorted {
            Double($0.0.1) / Double($0.0.0) > Double($0.1.1) / Double($0.1.0)
            }.filter { item in
                guard cap > 0 else {
                    return false
                }
                cap -= item.0
                return true
        }
        
        guard case let last? = sortedItem.popLast() else {
            return []
        }
        sortedItem.append((last.0 + cap, Double(last.0 + cap) * last.1 / Double(last.0)))
        
        return sortedItem
    }
    
    var totalValue: Double {
        return reduce(0, { $0 + $1.1 })
    }
}

let data: [Item] = [(10, 10), (100, 20), (120, 30)]
let knapsack = data.knapsackFilled(withCapacity: 50)
knapsack.totalValue

