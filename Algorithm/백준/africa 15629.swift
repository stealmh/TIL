//
//  africa 15629.swift
//  Baekjoon
//
//  Created by mino on 2023/12/19.
//

import Foundation

let N = Int(readLine()!)!
var travelRoot: [String] = []

var totalFee = 0

for _ in 0..<N {
    let input = readLine()!
    travelRoot.append(input)
}

for (idx, country) in travelRoot.enumerated() {
    if country == "ethiopia" || country == "kenya" || country == "tanzania" {
        totalFee += 50
    }
    
    if country == "zimbabwe" || country == "zambia" {
        if (idx < N - 1 && country == "zimbabwe" && travelRoot[idx + 1] == "zambia") ||
           (idx < N - 1 && country == "zambia" && travelRoot[idx + 1] == "zimbabwe") {
            totalFee += 50
        } else {
            if idx > 0 && travelRoot[idx - 1] != "zambia" && country == "zimbabwe" {
                totalFee += 30
            } else if idx > 0 && travelRoot[idx - 1] != "zimbabwe" && country == "zambia" {
                // zambia
                totalFee += 50
            } else if idx == 0 {
                totalFee += country == "zimbabwe" ? 30 : 50
            }
        }
    }
    
    // 1. 나미비아인지 체크
    // 2. 지금까지 순회한 것 중에 나미비아보다 남아프리카가 먼저 나온적이 있다면 40원
    // 3. 아니라면 140원
    
    if country == "namibia" {
        if let a = travelRoot.firstIndex(of: "south-africa"), a <= idx {
            totalFee += 40
        } else {
            totalFee += 140
        }
    }
    
}

print(totalFee)
