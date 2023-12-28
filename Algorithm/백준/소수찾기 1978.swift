//
//  소수찾기 1978.swift
//  Baekjoon
//
//  Created by mino on 2023/12/28.
//

import Foundation

let N = Int(readLine()!)!

var value = readLine()!.split(separator: " ").map { Int($0)! }
var primeCount = 0

for i in value {
    if isPrime(i) {
        primeCount += 1
    }
}

print(primeCount)


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

