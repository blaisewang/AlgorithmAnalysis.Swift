//: # Activity Selection

//
// Created by blaise wang on 2017/5/1.
// Copyright (c) 2017 com.blaise.wang. All rights reserved.
//

typealias Activity = (Int, Int)

extension Collection where Iterator.Element == Activity, SubSequence.Iterator.Element == Iterator.Element {
    var activitySelection: [Activity] {
        guard case (let s, var f)? = first else {
            return []
        }
        return [(s, f)] + dropFirst().filter { start, finish in
            guard start >= f else {
                return false
            }
            f = finish
            return true
        }
    }
}

let data: [Activity] = [(1, 4),
                        (3, 5),
                        (0, 6),
                        (5, 7),
                        (3, 8),
                        (5, 9),
                        (6, 10),
                        (8, 11),
                        (8, 12),
                        (2, 13),
                        (12, 14)]
data.activitySelection
