//
//  이분그래프1707.swift
//  baekjoon
//
//  Created by 김민호 on 3/10/24.
//

import Foundation

let T = Int(readLine()!)!

var graph: [[Int]] = []
var visited: [Int] = []
var result: Bool = true

for _ in 0 ..< T {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let first = input[0]
    let second = input[1]
    
    graph = Array(repeating: [], count: first + 1)
    visited = Array(repeating: 0, count: first + 1)
    
    for _ in 0 ..< second {
        let inner_input = readLine()!.split(separator: " ").map { Int($0)! }
        let inner_first = inner_input[0]
        let inner_second = inner_input[1]
        
        graph[inner_first].append(inner_second)
        graph[inner_second].append(inner_first)
    }
    
    result = true
    
    for i in 1 ... first {
        if visited[i] == 0 {
            dfs(node: i, color: 1)
        }
        
        if !result {
            break
        }
    }
    
    print(result ? "YES" : "NO")
}

func dfs(node: Int, color: Int) {
    visited[node] = color
    
    for nextNode in graph[node] {
        if visited[nextNode] == 0 {
            dfs(node: nextNode, color: color * -1)
        }
        
        if visited[nextNode] == color {
            result = false
            return
        }
    }
}
