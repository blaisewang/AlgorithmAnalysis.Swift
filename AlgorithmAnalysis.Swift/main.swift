//
//  main.swift
//  AlgorithmAnalysis.Swift
//
//  Created by blaise wang on 2017/4/27.
//  Copyright (c) 2017 com.blaise.wang. All rights reserved.
//

import Foundation

let (cost, expr) = [30, 35, 15, 5, 10, 20, 25].optimalMatrixChaining
print(cost)
print(expr)

let (distance, LCS) = "ABCBDAB".longestCommonSubsequence(with: "BDCABA")
print(distance)
print(LCS)

let data: [Activity] = [(1, 4), (3, 5), (0, 6), (5, 7), (3, 8), (5, 9), (6, 10), (8, 11), (8, 12), (2, 13), (12, 14)].activitySelection
print(data.activitySelection)
