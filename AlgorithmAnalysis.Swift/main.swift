//
//  main.swift
//  AlgorithmAnalysis.Swift
//
//  Created by blaise wang on 2017/4/27.
//  Copyright (c) 2017 com.blaise.wang. All rights reserved.
//

import Foundation

var sequence = [30, 35, 15, 5, 10, 20, 25]

var mcm = MatrixChainMultiplication.init(sequence: sequence)
print(mcm.result())