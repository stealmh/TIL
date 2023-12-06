//
//  블랙잭2798.swift
//  Baekjoon
//
//  Created by mino on 2023/12/06.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let cardList = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let m = input[1]
var answerList: [Int] = []

for i in 0..<n {
    for j in 0..<n {
        for k in 0..<n {
            if k != i && k != j && i != j {
                let sum = cardList[i] + cardList[j] + cardList[k]
                if !(sum > m) {
                    answerList.append(sum)
                }
                    
            }
        }
    }
}

print(answerList.sorted(by: >)[0])
