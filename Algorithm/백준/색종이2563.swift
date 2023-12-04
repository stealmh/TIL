//
//  색종이2563.swift
//  Baekjoon
//
//  Created by DEV IOS on 2023/12/04.
//
import Foundation

let n = Int(readLine()!)!
var array = Array(repeating: Array(repeating: 0, count: 100), count: 100)

for _ in 0 ..< n {
    let position = readLine()!.split(separator: " ").map { Int($0)! }
    let poX = position[0]
    let poY = position[1]
    
    for i in poX..<poX + 10 {
        for j in poY..<poY + 10 {
            array[i][j] = 1
        }
    }
}

var totalCout = 0

for i in array {
   let count = i.filter { $0 == 1 }.count
    totalCout += count
}

print(totalCout)
