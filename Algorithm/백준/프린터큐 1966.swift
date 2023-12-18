//
//  프린터큐 1966.swift
//  Baekjoon
//
//  Created by mino on 2023/12/18.
//

import Foundation

for _ in 0..<Int(readLine()!)! {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let findIndex = input[1]
    let importants = readLine()!.split(separator: " ").map { Int($0)! }

    var queue: [Int] = []
    var queueIdex: [Int] = []

    for (idx, i) in importants.enumerated() {
        queue.append(i)
        queueIdex.append(idx)
    }

    var count = 1

    while !queue.isEmpty {
        let big = queue.max()!
        
        if big == queue[0] && queueIdex[0] == findIndex {
            print(count)
            break
        }

        if big == queue[0] {
            count += 1
            queue.removeFirst()
            queueIdex.removeFirst()
        } else {
            queue.append(queue[0])
            queueIdex.append(queueIdex[0])
            queue.removeFirst()
            queueIdex.removeFirst()
        }
    }

}
