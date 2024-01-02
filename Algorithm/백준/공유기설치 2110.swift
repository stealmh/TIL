//
//  공유기설치 2110.swift
//  Baekjoon
//
//  Created by mino on 2024/01/02.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let N = input[0]
let C = input[1]

var town: [Int] = []

for _ in 0..<N {
    let house = Int(readLine()!)!
    town.append(house)
}

town.sort()

var start = 1
var end = town.last! - town.first!
var count = 0
var answer = 0

while start <= end {
    ///반복할 때마다 초기화해주어야 하는 값들
    let mid = (start + end) / 2
    var startHouse = town[0]
    count = 1

    for i in 0..<N {
        if town[i] - startHouse >= mid {
            count += 1
            startHouse = town[i]
        }
    }
    
    if count >= C {
        start = mid + 1
        answer = mid
    } else {
        end = mid - 1
    }
}
print(answer)
