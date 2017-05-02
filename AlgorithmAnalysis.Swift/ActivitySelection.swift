//
// Created by blaise wang on 2017/5/1.
// Copyright (c) 2017 com.blaise.wang. All rights reserved.
//

import Foundation

typealias Activity = (Int, Int)

extension Collection where Iterator.Element == (Int, Int), SubSequence.Iterator.Element == Iterator.Element {
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
