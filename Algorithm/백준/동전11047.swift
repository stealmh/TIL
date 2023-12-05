//
//  동전11047.swift
//  Baekjoon
//
//  Created by mino on 2023/12/05.
//

import Foundation

var input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
var k = input[1]

var sum = 0
var coinValueArray: [Int] = []

for _ in 0 ..< n {
    let input = Int(readLine()!)!
    coinValueArray.append(input)
}

for i in coinValueArray.reversed() {
    if k >= i {
        sum += k / i
        k = k % i
    }
}

print(sum)
