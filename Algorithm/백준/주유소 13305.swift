//
//  main.swift
//  baekjoon
//
//  Created by 김민호 on 3/16/24.
//

import Foundation

let n = Int(readLine()!)!

var load = readLine()!.split(separator: " ").map { Int($0)! }
var city = readLine()!.split(separator: " ").map { Int($0)! }

var total = city[0] * load[0]
var minimumValue = city[0]

for i in 1..<n-1 {
    if city[i] < minimumValue {
        minimumValue = city[i]
        total += city[i] * load[i]
    } else {
        total += minimumValue * load[i]
    }
}

print(total)
