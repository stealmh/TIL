//
//  영화감독 숌 1436.swift
//  Baekjoon
//
//  Created by mino on 2023/12/18.
//

import Foundation

let input = Int(readLine()!)!

var answer = 1
var count = 0

while true {
    
    var check = answer
    while check >= 666 {
        if check % 1000 == 666 {
            count += 1
            break
        }
        check /= 10
    }
    
    if count == input {
        print(answer)
        break
    }
    answer += 1
}
