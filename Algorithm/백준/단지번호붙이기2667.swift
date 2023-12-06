//
//  단지번호붙이기2667.swift
//  Baekjoon
//
//  Created by mino on 2023/12/06.
//

import Foundation

let n = Int(readLine()!)!
var graph: [[Int]] = []
var houseCount: Int = 0
var miniCount: Int = 0
var miniCountArray: [Int] = []

let dx = [-1,1,0,0]
let dy = [0,0,-1,1]

for _ in 0..<n {
    let input = readLine()!.map { Int(String($0))! }
    graph.append(input)
}

func dfs(_ x: Int, _ y: Int) -> Bool {
    if x < 0 || y < 0 || x >= n || y >= n {
        return false
    }
    
    if graph[x][y] == 1 {
        graph[x][y] = 0
        miniCount += 1
        
        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            dfs(nx,ny)
        }
        return true
    }
    
    return false
}


for i in 0 ..< n {
    for j in 0 ..< n {
        if dfs(i, j) {
            houseCount += 1
            miniCountArray.append(miniCount)
            miniCount = 0
        }
    }
}

print(houseCount)

for i in miniCountArray.sorted() {
    print(i)
}
