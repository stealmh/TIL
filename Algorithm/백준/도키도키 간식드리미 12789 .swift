//
//  도키도키 간식드리미 12789 .swift
//  Baekjoon
//
//  Created by mino on 2024/01/05.
//

import Foundation

let N = Int(readLine()!)!
var lines = readLine()!.split(separator: " ").map { Int($0)! }
var number = 1
var stack: [Int] = []
let zero = 0

while !lines.isEmpty {
    let checkNumber = lines.removeFirst()
    
    /// case 2. stack의 마지막 숫자가 타겟이면
    while !stack.isEmpty && stack.last! == number {
        stack.removeLast()
        number += 1
    }
    
    /// case 1. 다음에 와야할 숫자가 타겟이면
    if checkNumber == number {
        number += 1
    } else {
        stack.append(checkNumber)
    }
}

for i in stack.reversed() {
    if i == number {
        stack.removeFirst()
        number += 1
    } else { break }
}

if stack.isEmpty {
    print("Nice")
} else {
    print("Sad")
}








