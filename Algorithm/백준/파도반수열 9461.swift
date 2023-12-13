//
//  파도반수열 9461.swift
//  Baekjoon
//
//  Created by mino on 2023/12/13.
//

import Foundation

let T = Int(readLine()!)!
var dp = [Int](repeating: 0, count: 100 + 1)
dp[1] = 1
dp[2] = 1
dp[3] = 1
dp[4] = 2
dp[5] = 2

for i in 6...100 {
    dp[i] = dp[i - 1] + dp[i - 5]
}


for _ in 0..<T {
    let input = Int(readLine()!)!
    print(dp[input])
}
