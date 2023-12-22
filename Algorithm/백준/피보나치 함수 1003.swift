//
//  피보나치 함수 1003.swift
//  Baekjoon
//
//  Created by mino on 2023/12/22.
//

import Foundation


let T = Int(readLine()!)!
var dp: [Int] = [Int](repeating: 0, count: 40 + 1)
dp[0] = 0
dp[1] = 1
dp[2] = 1

for i in 3...40 {
    dp[i] = dp[i - 1] + dp[i - 2]
}

for _ in 0..<T {
    let input = Int(readLine()!)!
    if input == 0 {
        print(1, 0)
    } else if input == 1 {
        print(0, 1)
    } else {
        print(dp[input - 1], dp[input])
    }
}
