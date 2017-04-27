//
// Created by blaise wang on 2017/4/27.
// Copyright (c) 2017 com.blaise.wang. All rights reserved.
//

import Foundation

open class MatrixChainMultiplication {
    private var pInt = [Int]()
    private var sInt = [[Int]]()

    init(sequence: [Int]) {
        pInt.append(contentsOf: sequence)
        sInt = Array(repeatElement(Array(repeating: 0, count: pInt.count), count: pInt.count))
    }

    func result() -> Int {
        var mInt = Array(repeatElement(Array(repeating: 0, count: pInt.count), count: pInt.count))

        for l in 1..<pInt.count - 1 {
            for i in 1..<pInt.count - l {
                let j = i + l;
                mInt[i][j] = Int.max
                for k in i..<j {
                    let q = mInt[i][k] + mInt[k + 1][j] + (pInt[i - 1] * pInt[k] * pInt[j]);
                    if (q < mInt[i][j]) {
                        mInt[i][j] = q;
                        sInt[i][j] = k;
                    }
                }
            }
        }

        return mInt[1][pInt.count - 1]
    }




}
