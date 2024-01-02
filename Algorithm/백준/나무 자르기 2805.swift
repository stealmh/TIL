//
//  나무 자르기 2805.swift
//  Baekjoon
//
//  Created by mino on 2024/01/02.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
// 나무의 수
let N = input[0]
// 가져가야 하는 나무의 길이
let M = input[1]
var trees = readLine()!.split(separator: " ").map { Int($0)! }


trees.sort()

var start = 1
var end = trees.last!
var myMid = 0


func binarySearch() {
    while start <= end {
        let mid = (start + end) / 2
        var treeLength = 0
        
        for i in trees {
            if i > mid { treeLength += i - mid }
        }
        
        if treeLength >= M {
            start = mid + 1
            myMid = max(myMid, mid)
        } else {
            end = mid - 1
        }
    }
}

binarySearch()
print(myMid)






