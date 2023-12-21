//
//  숫자카드 10815.swift
//  Baekjoon
//
//  Created by mino on 2023/12/21.
//

import Foundation

struct MakeHash: Hashable {
    var num: String
}

var N = Int(readLine()!)!
var convertMyCard: [String: Int] = [:]
var myCardArray = readLine()!.split(separator: " ").map { String($0) }
var M = Int(readLine()!)!

var cardCheckArray = readLine()!.split(separator: " ").map { String($0) }
var check = [String](repeating: "0", count: M)
let convertCard = convert(myCardArray)

func convert(_ input: [String]) -> [String: Int] {
    var convertArray: [String: Int] = [:]
    
    for i in input {
        let hash = MakeHash(num: i).hashValue
        convertArray[i] = hash
    }
    
    return convertArray
}

for (idx, value) in cardCheckArray.enumerated() {
    
    /// 데이터가 존재하면 해당하는 idx에 1을 주입
    if let _ = convertCard[value] {
        check[idx] = "1"
    }
}

print(check.joined(separator: " "))
