//
//  랜선 자르기 1654.swift
//  Baekjoon
//
//  Created by mino on 2024/01/02.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let K = input[0], N = input[1]
var lanLine: [Int] = []

for _ in 0..<K {
    lanLine.append(Int(readLine()!)!)
}

lanLine.sort()

var start = 1
var end = lanLine.last!

func binarySearch() -> Int {
    
    while start <= end {
        var count = 0
        let mid = (start + end) / 2
        
        for i in lanLine {
            count += i / mid
        }
        
        if count >= N {
            start = mid + 1
        } else {
            end = mid - 1
        }
    }
    return end
}

print(binarySearch())
