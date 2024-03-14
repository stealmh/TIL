//
//  하노이탑1914.swift
//  Baekjoon
//
//  Created by mino on 2024/03/14.
//

import Foundation


let N = Int(readLine()!)!

var flag = N > 20 ? false : true

print(pow(2,N) - 1)


func hanoi(N: Int, start: Int, end: Int, via: Int) {
    if N == 1 {
        print("\(start) \(end)")
    } else {
        hanoi(N: N - 1, start: start, end: via, via: end)
        print("\(start) \(end)")
        hanoi(N: N - 1, start: via, end: end, via: start)
    }
    
}

if flag {
    hanoi(N: N, start: 1, end: 3, via: 2)
}
