//
//  AC 5430.swift
//  baekjoon
//
//  Created by 김민호 on 3/21/24.
//

import Foundation

let T = Int(readLine()!)!

for _ in 0..<T {
    let action = readLine()!.map { String($0) }
    var tail = Int(readLine()!)!
    var array = readLine()!.dropFirst().dropLast().split(separator: ",")
    
    var isReversed = false
    var head = 0
    
    for i in action {
        if i == "R" {
            isReversed.toggle()
        } else {
            if isReversed { tail -= 1 }
            else { head += 1 }
            
            if head > tail { break }
        }
    }
    
    if head > tail {
        print("error")
    } else {
        if isReversed { print("[\(array[head..<tail].reversed().joined(separator: ","))]") }
        else { print("[\(array[head..<tail].joined(separator: ","))]") }
    }
}
