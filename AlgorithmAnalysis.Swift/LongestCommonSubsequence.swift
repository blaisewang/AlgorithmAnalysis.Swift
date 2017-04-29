//
// Created by blaise wang on 2017/4/30.
// Copyright (c) 2017 com.blaise.wang. All rights reserved.
//

import Foundation

extension String {
    public func makeLCSWith(_ s: String) -> (Int, String) {
        var table = (0...self.characters.count).map { _ in
            (0...s.characters.count).map { _ in
                0
            }
        }

        for row in 1...self.characters.count {
            for column in 1...s.characters.count {
                if (self[characters.index(startIndex, offsetBy: row - 1)] != s[s.characters.index(s.startIndex, offsetBy: column - 1)]) {
                    table[row][column] = table[row - 1][column] >= table[row][column - 1] ? table[row - 1][column] : table[row][column - 1]
                } else {
                    table[row][column] = table[row - 1][column - 1] + 1
                }
            }
        }

        var LCS = ""
        func makeLCS(row: Int, column: Int) {
            if (row == 0 || column == 0) {
                return
            }

            if (self[characters.index(startIndex, offsetBy: row - 1)] != s[s.characters.index(s.startIndex, offsetBy: column - 1)] || table[row][column] != table[row - 1][column - 1] + 1) {
                if (self[characters.index(startIndex, offsetBy: row - 1)] != s[s.characters.index(s.startIndex, offsetBy: column - 1)] && table[row - 1][column] >= table[row][column - 1]) {
                    makeLCS(row: row - 1, column: column);
                } else {
                    makeLCS(row: row, column: column - 1);
                }
            } else {
                makeLCS(row: row - 1, column: column - 1);
                LCS.append(self[characters.index(startIndex, offsetBy: row - 1)])
            }
        }

        makeLCS(row: self.characters.count, column: s.characters.count)
        let distance = (self.characters.count > s.characters.count ? self.characters.count : s.characters.count) - LCS.characters.count

        return (distance, LCS)
    }
}
