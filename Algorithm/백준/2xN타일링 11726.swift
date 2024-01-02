//
//  2xN타일링 11726.swift
//  Baekjoon
//
//  Created by mino on 2024/01/02.
//

import Foundation

/*
 2*n 타일링
 
 dp[1] = 1가지 (2 * 1 타일 1개)
 dp[2] = 2가지 (2 * 1 타일 배치 + 1 * 2 타일 배치)
 dp[3] = 3가지 (dp[2] + dp[1])
 dp[4] = dp[3] + dp[2] 5
 dp[5] = 8
 dp[6] = 13
 dp[7] = 21
 dp[8] = 34
 dp[9] = 55
 */

let N = Int(readLine()!)!

var dp = [Int](repeating: 0, count: N + 1)

if N <= 2 {
    print(N)
} else {
    dp[1] = 1
    dp[2] = 2
    
    for i in 3...N {
     dp[i] = (dp[i - 1] + dp[i - 2]) % 10007
    }
    print(dp[N])
}
