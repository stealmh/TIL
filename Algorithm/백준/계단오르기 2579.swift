//
//  계단오르기 2579.swift
//  Baekjoon
//
//  Created by mino on 2023/12/27.
//

import Foundation

let N = Int(readLine()!)!

var stair = [Int](repeating: 0, count: N + 1)
var dp = [Int](repeating: 0, count: N + 1)

for i in 1..<N + 1{
    let input = Int(readLine()!)!
    stair[i] = input
}

if N == 1 {
    print(stair[1])
} else if N == 2 {
    print(stair[1] + stair[2])
} else {
    dp[1] = stair[1]
    dp[2] = stair[1] + stair[2]
    dp[3] = max(dp[1], dp[0] + stair[2]) + stair[3]
    
    for i in 3..<N + 1 {
        dp[i] = max(dp[i - 2], dp[i - 3] + stair[i - 1]) + stair[i]
    }

    print(dp[N])
}
