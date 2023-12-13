//
//  연속합 1912.swift
//  Baekjoon
//
//  Created by mino on 2023/12/13.
//

import Foundation

/*
 [10 -4  3 1  5  6  -35 12 21 -1]
 [10, 6, 9 10 15 21 -14  ] -> 더해야 할 것과 누적해서 더한것중에 큰것으로, 더해야할것이 더 크다면 새로 시작한다
 */

let N = Int(readLine()!)!

let number = readLine()!.split(separator: " ").map { Int($0)! }
var check = 0
var dp: [Int] = [Int](repeating: -1001, count: N + 1)


dp[0] = number[0]

for i in 1..<N {
    // 더
    dp[i] = max(number[i], dp[i - 1] + number[i])
}

print(dp.max()!)
