# AlgorithmAnalysis.Swift
Algorithm Analysis Lesson Lab Work in Swift


## Matrix Chain Multiplication
Solve matrix chain multiplication problem by dynamic programming.

Given a sequence which represents the chain of matrices such that the ith matrix Mi is of dimension `p[i-1]` x `p[i]`.

And get the most efficient way to multiply these matrices and the minimum number of multiplications needed to multiply the chain.


## Longest Common Subsequence
Get longest common subsequence from string A and B. 

Calculate the distance between these two strings.


## Activity Selection
Given a sequence of activities `[(Int, Int)]`, the first integer means start time, and the second integer means finish time.

And get the selection of non-conflicting activities.

## Fractional Knapsack Problem

The goal is to fill a knapsack with fractional amounts of different materials chosen to maximize the value of the selected materials.

Given a sequence of item(s) `[(Int, Double)]`, the `Int` of the tuple means the weight of item, the `Double` means the value at this weight.

Use `.knapsackFilled(withCapacity: Int)` function to get the sequence of item(s) which have maximun value.

Use `.totalValue` to calculate the value of a sequence of item(s).

