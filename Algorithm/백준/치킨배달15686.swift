//
//  치킨배달15686.swift
//  Baekjoon
//
//  Created by mino on 2024/03/13.
//

import Foundation

let nmInput = readLine()!.split(separator: " ").map { Int($0)! }
let n = nmInput[0]
let m = nmInput[1]

var map = [[Int]]()
var house: [(Int, Int)] = []
var chicken: [(Int, Int)] = []

for i in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    map.append(input)
    
    for j in 0 ..< n {
        if input[j] == 1 {
            house.append((i,j))
        } else if input[j] == 2 {
            chicken.append((i,j))
        }
    }
}

var chickenCheck = Array(repeating: false, count: chicken.count)
var answer = Int.max

func back(depth: Int, idx: Int) {
    if depth == m {
        var ans = 0
        
        for (row, col) in house {
            var houseMinimum = Int.max
            for j in 0..<chicken.count {
                if chickenCheck[j] {
                    let value = abs(row - chicken[j].0) + abs(col - chicken[j].1)
                    houseMinimum = min(houseMinimum, value)
                }
            }
            ans += houseMinimum
        }
        answer = min(answer, ans)
    }
    
    for i in idx..<chicken.count {
        if !chickenCheck[i] {
            chickenCheck[i] = true
            back(depth: depth + 1, idx: i)
            chickenCheck[i] = false
        }
    }
}

back(depth: 0, idx: 0)
print(answer)

