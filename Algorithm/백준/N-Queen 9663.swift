//
//  N-Queen 9663.swift
//  Baekjoon
//
//  Created by mino on 2023/12/28.
//

import Foundation

let input = Int(readLine()!)!

var visitedCheck = [Bool](repeating: false, count: input)
var chessCheck = [Int](repeating: 0, count: input)
var chessCount = 0

func validCheck(_ x: Int) -> Bool {
    for i in 0..<x {
        if chessCheck[x] == chessCheck[i] || abs(chessCheck[x] - chessCheck[i]) == abs(x - i) {
            return false
        }
    }
    return true
}

func backtracking(_ x: Int) {
    if x == input {
        chessCount += 1
        return
    }
    
    for i in 0..<input {
        if visitedCheck[i] {
            continue
        }
        
        chessCheck[x] = i
        if validCheck(x) {
            visitedCheck[i] = true
            backtracking(x + 1)
            visitedCheck[i] = false
        }
    }
}

backtracking(0)

print(chessCount)
