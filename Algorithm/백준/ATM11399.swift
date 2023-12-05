//
//  ATM11399.swift
//  Baekjoon
//
//  Created by DEV IOS on 2023/12/05.
//

import Foundation

var n = Int(readLine()!)!
var people = readLine()!.split(separator: " ").map { Int($0)! }.sorted()

var sum = 0

for p in people {
    sum += p * n
    n -= 1
}

print(sum)
