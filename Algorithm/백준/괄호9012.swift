//
//  괄호9012.swift
//  Baekjoon
//
//  Created by mino  on 2023/12/06.
//

import Foundation

let N = Int(readLine()!)!

for _ in 0 ..< N {
    let input = readLine()!.map { String($0) }
    var checkArray: [String] = []

    for i in input {
        checkArray.append(i)
        // 1. 2개이상 있다
        // 2. 2번째 이전이 "("이다
        // 3. 직전이 ")"이다.
        if checkArray.count >= 2 && checkArray[checkArray.count - 2] == "(" && checkArray[checkArray.count - 1] == ")" {
            checkArray.remove(at: checkArray.count - 2)
            checkArray.remove(at: checkArray.count - 1)
        }
    }
    
    if checkArray.isEmpty {
        print("YES")
    } else {
        print("NO")
    }
    checkArray = []
}


