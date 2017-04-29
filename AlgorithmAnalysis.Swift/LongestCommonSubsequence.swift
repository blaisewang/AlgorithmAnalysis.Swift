//
// Created by blaise wang on 2017/4/30.
// Copyright (c) 2017 com.blaise.wang. All rights reserved.
//

import Foundation

extension String {
    func longestCommonSubsequence(with s: String) -> (Int, String) {
        var table = (0...characters.count).map { _ in
            (0...s.characters.count).map { _ in
                0
            }
        }

        for row in 1...characters.count {
            for column in 1...s.characters.count {
                if self[characters.index(startIndex, offsetBy: row - 1)] != s[s.characters.index(s.startIndex, offsetBy: column - 1)] {
                    table[row][column] = table[row - 1][column] >= table[row][column - 1] ? table[row - 1][column] : table[row][column - 1]
                } else {
                    table[row][column] = table[row - 1][column - 1] + 1
                }
            }
        }

        var longestCommonSubsequence = ""

        func lcs(row: Int, column: Int) {
            guard row > 0 && column > 0 else {
                return
            }

            if self[characters.index(startIndex, offsetBy: row - 1)] != s[s.characters.index(s.startIndex, offsetBy: column - 1)] || table[row][column] != table[row - 1][column - 1] + 1 {
                if self[characters.index(startIndex, offsetBy: row - 1)] != s[s.characters.index(s.startIndex, offsetBy: column - 1)] && table[row - 1][column] >= table[row][column - 1] {
                    lcs(row: row - 1, column: column)
                } else {
                    lcs(row: row, column: column - 1)
                }
            } else {
                lcs(row: row - 1, column: column - 1)
                longestCommonSubsequence.append(self[characters.index(startIndex, offsetBy: row - 1)])
            }
        }

        lcs(row: characters.count, column: s.characters.count)
        let distance = (characters.count > s.characters.count ? characters.count : s.characters.count) - longestCommonSubsequence.characters.count

        return (distance, longestCommonSubsequence)
    }
}
