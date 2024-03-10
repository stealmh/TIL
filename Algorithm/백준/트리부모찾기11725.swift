//
//  트리부모찾기11725.swift
//  baekjoon
//
//  Created by 김민호 on 3/10/24.
//

import Foundation

let N = Int(readLine()!)!

var graph: [[Int]] = Array(repeating: [], count: N + 1)
var visited: [Int] = Array(repeating: 0, count: N + 1)

for _ in 0 ..< N - 1 {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let first = input[0]
    let second = input[1]
    
    graph[first].append(second)
    graph[second].append(first)
}


func dfs(input: Int) {
    
    for i in graph[input] {
        if visited[i] == 0 {
            visited[i] = input
            dfs(input: i)
        }
    }
}

dfs(input: 1)

visited.removeFirst()
visited.removeFirst()

print(visited.map { String($0) }.joined(separator: " "))

