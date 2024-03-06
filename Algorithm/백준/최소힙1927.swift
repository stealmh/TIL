//
//  최소힙1927.swift
//  Baekjoon
//
//  Created by mino on 2024/03/06.
//

import Foundation

struct Heap<T: Comparable> {
    private var elements: [T] = []
    private let compare: (T, T) -> Bool
    
    init(compare: @escaping (T,T) -> Bool ) {
        self.compare = compare
    }
    
    mutating func insert(element: T) {
        if elements.isEmpty {
            elements.append(element)
            elements.append(element)
            return
        }
        elements.append(element)
        swimUp(index: elements.count - 1)
    }
    
    mutating func swimUp(index: Int) {
        var index = index
        while index > 1 && compare(elements[index], elements[index / 2]) {
            elements.swapAt(index, index / 2)
            index /= 2
        }
    }
    
    mutating func pop() -> T? {
        if elements.count < 2 { return nil }
        elements.swapAt(1, elements.count - 1)
        let delete = elements.removeLast()
        drillDown(index: 1)
        return delete
    }
    
    mutating func drillDown(index: Int) {
        var swapIndex = index
        var isSwap = false
        let leftIndex = index * 2
        let rightIndex = index * 2 + 1
        
        if leftIndex < elements.endIndex && compare(elements[leftIndex], elements[swapIndex]) {
            swapIndex = leftIndex
            isSwap = true
        }
        
        if rightIndex < elements.endIndex && compare(elements[rightIndex], elements[swapIndex]) {
            swapIndex = rightIndex
            isSwap = true
        }
        
        if isSwap {
            elements.swapAt(swapIndex, index)
            drillDown(index: swapIndex)
        }
    }
}

var minHeap = Heap<Int>(compare: <)

let n = Int(readLine()!)!

for _ in 0..<n {
    let x = Int(readLine()!)!
    if x == 0 {
        print(maxHeap.pop() ?? 0)
    } else {
        maxHeap.insert(element: x)
    }
}
