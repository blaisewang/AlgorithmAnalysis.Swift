//
//  main.swift
//  AlgorithmAnalysis.Swift
//
//  Created by blaise wang on 2017/4/27.
//  Copyright (c) 2017 com.blaise.wang. All rights reserved.
//

import Foundation

var mcm = MatrixChainMultiplication.init(sequence: [30, 35, 15, 5, 10, 20, 25])

print(mcm.result())
print(mcm.optimalParenthesis())
