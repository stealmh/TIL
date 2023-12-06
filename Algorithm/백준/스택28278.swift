//
//  스택28278.swift
//  Baekjoon
//
//  Created by mino on 2023/12/06.
//

import Foundation

let N = Int(readLine()!)!
var stack: [Int] = []

for _ in 0 ..< N {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    // 1 - X: 정수 X를 스택에 넣는다. (1 ≤ X ≤ 100,000)
    switch input[0] {
    case 2:
        // 2 - 스택에 정수가 있다면 맨 위의 정수를 빼고 출력한다. 없다면 -1을 대신 출력한다.
        if !stack.isEmpty {
            print(stack.popLast()!)
        } else {
            print(-1)
        }
    case 3:
        // 3 - 스택에 들어있는 정수의 개수를 출력한다.
        print(stack.count)
    case 4:
        // 4 - 스택이 비어있으면 1, 아니면 0을 출력한다.
        if stack.isEmpty {
            print(1)
        } else {
            print(0)
        }
    case 5:
        // 5 - 스택에 정수가 있다면 맨 위의 정수를 출력한다. 없다면 -1을 대신 출력한다.
        if !stack.isEmpty {
            print(stack[stack.count - 1])
        } else {
            print(-1)
        }
    default:
        stack.append(input[1])
    }
}
