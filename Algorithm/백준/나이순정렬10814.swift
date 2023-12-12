//
//  나이순정렬10814.swift
//  Baekjoon
//
//  Created by DEV IOS on 2023/12/12.
//

import Foundation

let n = Int(readLine()!)!

var people: [(Int,String)] = []

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { String($0) }
    let age = Int(input[0])!
    let name = input[1]
    
    people.append((age, name))
}

people.sort { $0.0 < $1.0 }
//
for i in people {
    print("\(i.0) \(i.1)")
}
