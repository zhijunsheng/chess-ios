//
//  SimpleLoopTests.swift
//  chessTests
//
//  Created by Bowen Lin on 2018-02-10.
//  Copyright © 2018 GoldThumb Inc. All rights reserved.

import XCTest

class SimpleLoopTests: XCTestCase {
    
    func testDivide(){
        divide()
    }
    
    func divide(){
        var sum = 0
        for a in 1...100{
            if a % 7 == 0{
                sum = sum + 1
            }
        }
        print("\(sum)")
    }
    
    func testCount(){
        XCTAssertEqual(6, count(a: [6, 5, 4, 3, 2, 2]))
    }
    
    func count(a: [Int]) -> Int{
        var sum = 0
        for _ in a {
            sum = sum + 1
        }
        print(sum)
        return sum
    }
    
    func testFactorial(){
        var sum = 1
        for a in 1...5 {
            sum = sum * a
            print("sum = \(sum)")
        }
    }
    
    func testSquares(){
        for a in 1...9{
            print("\(a * a) ")
        }
    }
    
    func testContains() {
        XCTAssertTrue(contains(arr: [31, 1, 0, -1, 42], target: 31))
        XCTAssertFalse(contains(arr: [48, 9, 34, 2], target: 10))
    }
    
    func contains(arr: [Int], target: Int) -> Bool {
        for a in arr {
            if a == target {
                return true
            } 
        }
        return false
    }
    
    func testpiramid(){
        
        var a = 7
        while a > 0{
            for b in 1...a{
                print(b ,terminator:"")
            }
            print("")
            a = a - 1
        }
    }
    
    func testMaxArray(){
        XCTAssertEqual(50, maxArray(array1: [5, 10, 7, 23, 5, 50]))
    }
    
    func maxArray(array1: [Int])-> Int{
        var max = 0
        for a in array1{
            if a > max {
                max = a
            }
            print(max)
        }
        return max
    }
    
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
        let sum = add(x: 5, y: 4)
        print(sum)
        
        XCTAssertEqual(9, sum)
    }
    
    func add(x: Int, y: Int) -> Int {
        let sum = x + y
        return sum
    }
}

