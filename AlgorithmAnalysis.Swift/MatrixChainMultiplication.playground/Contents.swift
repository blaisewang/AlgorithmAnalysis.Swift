//:# MatrixChainMultiplication

//
// Created by blaise wang on 2017/4/27.
// Copyright (c) 2017 com.blaise.wang. All rights reserved.
//

/// Matrix Chain Multiplication
///
/// Given an array p[] which represents the chain of matrices such that
/// the ith matrix Mi is of dimension p[i-1] x p[i]. We need to write a
/// function MatrixChainOrder() that should return the minimum number of
/// multiplications needed to multiply the chain.

indirect enum Expression {
    case matrix(Int)
    case multiply(Expression, Expression)
}

extension Expression: CustomStringConvertible {
    var description: String {
        switch self {
        case let .matrix(id):
            return "M\(id)"
        case let .multiply(lhs, rhs):
            return "(\(lhs) \(rhs))"
        }
    }
}

extension Collection where Iterator.Element == Int, Index == Int, IndexDistance == Int {
    /// Computes the minimal cost of matrix chain multiplication
    var optimalMatrixChaining: (Int, Expression) {
        /// Compute cost matrix
        var temp = (0..<count).map { _ in
            (0..<count).map { _ in
                0
            }
        }
        var cost = temp
        for l in 1..<count - 1 {
            for i in 1..<count - l {
                let j = i + l
                cost[i][j] = Int.max
                for k in i..<j {
                    let q = cost[i][k] + cost[k + 1][j] + (self[i - 1] * self[k] * self[j])
                    if (q < cost[i][j]) {
                        cost[i][j] = q
                        temp[i][j] = k
                    }
                }
            }
        }
        /// Construct operation
        func makeExpression(_ i: Int, _ j: Int) -> Expression {
            return i == j ? .matrix(i) : .multiply(makeExpression(i, temp[i][j]),
                                                   makeExpression(temp[i][j] + 1, j))
        }
        /// Return cost and expression
        return (cost[1][count - 1], makeExpression(1, count - 1))
    }
}

let (cost, expr) = [30, 35, 15, 5, 10, 20, 25].optimalMatrixChaining
cost
expr
