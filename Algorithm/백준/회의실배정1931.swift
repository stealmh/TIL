//
//  회의실배정1931.swift
//  Baekjoon
//
//  Created by mino on 2023/12/12.
//

import Foundation

let n = Int(readLine()!)!

var meet: [[Int]] = []

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let start = input[0]
    let end = input[1]
    meet.append([start, end])
}

meet.sort { $0[1] == $1[1] ? $0[0] < $1[0] : $0[1] < $1[1] }
// 끝나는 시간이 같으면, 시작시간이 빠른 순서대로 하고
// 그렇지 않으면 종료시간이 빠른순서대로

var endTime = 0
// 0으로 두고 첫번째 배열이 순회할 때 +1을 해서 그 첫번째 순서의 종료시간을 endTime에 집어넣을 수 있음
var count = 0

for i in meet {
    if i[0] >= endTime {
        count += 1
        endTime = i[1]
    }
}

print(count)
