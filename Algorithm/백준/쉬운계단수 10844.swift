//
//  쉬운계단수 10844.swift
//  Baekjoon
//
//  Created by DEV IOS on 2024/03/22.
//

import Foundation

let n = Int(readLine()!)!

var stair = Array(repeating: Array(repeating: 0, count: 10), count: 101)

stair[1] = [0,1,1,1,1,1,1,1,1,1]

for i in 2...100 {
    for j in 0...9 {
        if j == 0 {
            stair[i][j] = stair[i - 1][1]
        } else if j == 9 {
            stair[i][j] = stair[i - 1][8]
        } else {
            stair[i][j] = (stair[i - 1][j - 1] + stair[i - 1][j + 1]) % 1000000000
        }
    }
}

print(stair[n].reduce(0, +) % 1000000000)
