//
//  소트인사이드1427.swift
//  Baekjoon
//
//  Created by mino on 2023/12/07.
//

import Foundation

print(readLine()!.map { Int(String($0))! }.sorted(by: >).map { String($0) }.joined(separator: ""))
