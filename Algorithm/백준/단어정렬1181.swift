//
//  단어정렬1181.swift
//  Baekjoon
//
//  Created by mino on 2023/12/07.
//

import Foundation

let N = Int(readLine()!)!
var wordArray: Set<String> = []

for _ in 0 ..< N {
    let input = readLine()!
    wordArray.insert(input)
}

let a = wordArray.sorted().sorted { first, second in
    first.count < second.count
}



for i in a {
    print(i)
}
