//
//  소수구하기 1929.swift
//  Baekjoon
//
//  Created by mino on 2023/12/28.
//

import Foundation

var value = readLine()!.split(separator: " ").map { Int($0)! }

for i in value[0]...value[1] {
    if isPrime(i) {
        print(i)
    }
}



func isPrime(_ x: Int) -> Bool {
    
    if x == 1 {
        return false
    }
    
    if x == 2 || x == 3 {
        return true
    }
    
    if x % 2 == 0 {
        return false
    }
    
    let sqrtValue = Int(sqrt(Double(x)))
    for i in stride(from: 3, through: sqrtValue, by: 2) {
        if x % i == 0 {
            return false
        }
    }
    
    return true
}

