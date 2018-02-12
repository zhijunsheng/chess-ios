//
//  SimpleLoopTests.swift
//  chessTests
//
//  Created by Bowen Lin on 2018-02-10.
//  Copyright © 2018 GoldThumb Inc. All rights reserved.

import XCTest

class SimpleLoopTests: XCTestCase {
    
    func testArray(){
        XCTAssertEqual(10, addArray(intArray: [5, 2, 3]))
        XCTAssertEqual(0, addArray(intArray: []))
        XCTAssertEqual(6, addArray(intArray: [6]))
    }
    
    func addArray(intArray: [Int]) -> Int {
        var sum = 0
        for x in intArray {
            sum = sum + x
        }
        
        return sum
    }
    
    func testMultiply(){
        XCTAssertEqual(6, multiply(a: 2, b: 3, c: 1))
        XCTAssertEqual(6, multiply(a: 2, b: -3, c: -1))
        XCTAssertEqual(0, multiply(a: 2, b: 0, c: 1))
        XCTAssertEqual(-6, multiply(a: 2, b: -3, c: 1))
    }
    
    func multiply(a: Int, b: Int, c: Int) -> Int {
        let product = a * b * c
        return product
    }
    
    func testAdd() {
        let sum = add(x: 3, y: 4)
        print(sum)
        
        XCTAssertEqual(7, sum)
    }
    
    func add(x: Int, y: Int) -> Int {
        let sum = x + y
        return sum
    }
}
