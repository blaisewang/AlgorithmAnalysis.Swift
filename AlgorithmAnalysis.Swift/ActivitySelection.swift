//
// Created by blaise wang on 2017/5/1.
// Copyright (c) 2017 com.blaise.wang. All rights reserved.
//

import Foundation

extension Collection where Iterator.Element == (Int, Int), Index == Int, IndexDistance == Int {
    var activitySelection: [(Int, Int)] {
        var s = [first!]
        var j = 0

        for i in 2..<count {
            if self[i].0 >= self[j].1 {
                s.append(self[i])
                j = i
            }
        }

        return s
    }
}
