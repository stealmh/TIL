//
//  바이러스2606.swift
//  Baekjoon
//
//  Created by mino on 2023/12/07.
//

import Foundation

let computers = Int(readLine()!)!
let connectCount = Int(readLine()!)!

var house: [[Int]] = Array(repeating: [], count: computers + 1)
var visited = Array(repeating: 0, count: computers + 1)

for i in 0..<connectCount {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let first = input[0]
    let second = input[1]

    house[first].append(second)
    house[second].append(first)
}

//print(house)

func dfs(_ input: Int) {
    if visited[input] == 0 {
        visited[input] = 1
    } else {
        return
    }
    
    for i in house[input] {
        dfs(i)
    }
    return
}

dfs(1)
print(visited.reduce(0) { $0 + $1 } - 1)
