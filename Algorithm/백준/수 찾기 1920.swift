//
//  수 찾기 1920.swift
//  Baekjoon
//
//  Created by mino on 2024/01/02.
//

import Foundation

let N = Int(readLine()!)!
let NArray = readLine()!.split(separator: " ").map { Int($0)! }.sorted()

let M = Int(readLine()!)!
let MArray = readLine()!.split(separator: " ").map { Int($0)! }

for i in MArray {
    let start = 0
    let end = N - 1
    if binarySearch(target: i, start: start, end: end) {
        print("1")
    } else {
        print("0")
    }
    
}

func binarySearch(target: Int, start: Int, end: Int) -> Bool {
    if start > end {
        return false
    }
    
    let bs_mid = (start + end) / 2
    
    if NArray[bs_mid] == target {
        return true
    }
    
    if NArray[bs_mid] < target {
        return binarySearch(target: target, start: bs_mid + 1, end: end)
    } else {
        return binarySearch(target: target, start: start, end: bs_mid - 1)
    }
}


