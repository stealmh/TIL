//
//  피보나치수1 24416.swift
//  Baekjoon
//
//  Created by mino on 2023/12/13.
//

import Foundation

let input = Int(readLine()!)!

var fiboArray: [Int:Int] = [:]
fiboArray[0] = 0
fiboArray[1] = 1
fiboArray[2] = 1

for i in 3...input {
    fiboArray[i] = fiboArray[i - 1]! + fiboArray[i - 2]!
}

print("\(fiboArray[input]!) \(input - 2)")
