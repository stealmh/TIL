//
//  연산자 끼워넣기 14888.swift
//  Baekjoon
//
//  Created by mino on 2023/12/29.
//

import Foundation


let N = Int(readLine()!)!

let input = readLine()!.split(separator: " ").map { Int($0)! }
var operatorArray = readLine()!.split(separator: " ").map { Int($0)! }

var maxValue = Int.min
var minValue = Int.max

func backtracking(depth: Int, total: Int) {
    if depth == N {
        maxValue = max(maxValue, total)
        minValue = min(minValue, total)
        return
    }
    
    for i in 0...3 {
        if operatorArray[i] == 0 {
            continue
        }
        
        operatorArray[i] -= 1
        switch i {
        case 0:
            backtracking(depth: depth + 1, total: total + input[depth])
        case 1:
            backtracking(depth: depth + 1, total: total - input[depth])
        case 2:
            backtracking(depth: depth + 1, total: total * input[depth])
        case 3:
            backtracking(depth: depth + 1, total: total / input[depth])
        default: return
        }
        
        operatorArray[i] += 1
    }
    
}

backtracking(depth: 1, total: input[0])

print(maxValue)
print(minValue)
