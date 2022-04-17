//
//  NApplesInMBoxesTests.swift
//  chessTests
//
//  Created by Felix Lo on 2021-11-23.
//  Copyright © 2021 GoldThumb Inc. All rights reserved.
//

import XCTest

class NApplesInMBoxesTests: XCTestCase {
    func testApples() {
        // 0, 7
        XCTAssertEqual(2, numberOfBoxes(apples: 16))
        XCTAssertEqual(6, numberOfBoxes(apples: 46))
        XCTAssertEqual(1, numberOfBoxes(apples: 5))
        XCTAssertEqual(0, numberOfBoxes(apples: 0))
        XCTAssertEqual(1, numberOfBoxes(apples: 8))
        XCTAssertEqual(2, numberOfBoxes(apples: 9))
    }
    
    func testCubeRoot() {
        let num = 5
        let accuracy = 0.01
        let a: Int = Int(1/accuracy)
        
        for i in 0 ..< a {
            
        }
        
        print(abs(10 - 2.10 * 2.10 * 2.10))
        print(abs(10 - 2.11 * 2.11 * 2.11))
        print(abs(10 - 2.12 * 2.12 * 2.12))
        print(abs(10 - 2.13 * 2.13 * 2.13))
        print(abs(10 - 2.14 * 2.14 * 2.14))
        print(abs(10 - 2.15 * 2.15 * 2.15))
        
        // ...
        print(abs(10 - 2.49 * 2.49 * 2.49))
        print(abs(10 - 2.50 * 2.50 * 2.50))
    }
    
    /*
     
     0.0 -<
     
     epsilon = 0.01
     
     8.0   => 2.0
     
     10.0  => ?
     is 2.01 good? 2.01 * 2.01 * 2.01 <=> 10.0
     is 2.02 good? 2.02 * 2.02 * 2.02
     ...
     is 2.9
     
     
     27.0  => 3.0
     64.0  => 4.0
     125.0 => 5.0
     
     cube root of any number
     
     
     */
    
    /*
     
     n => m     in the place of 0
     0    0     0,1,2,3,4,5,6,7
     1    1     7,8,9,10,11,12,13,14
     7    1     1,2,3,4,5,6,7,8
     8    1     0,1,2,3,4,5,6,7
     9    2     7,8,9,10,11,12,13,14
     10   2
     16   2
     17   3
     ...
     e
     */
    
    func numberOfBoxes(apples: Int) -> Int {
        return (apples + 7)/8
    }
    
    func numberOfBoxes3(apples: Int) -> Int {
        return apples % 8 == 0 ? apples/8 : apples/8 + 1
    }
    
    
    func numberOfBoxes2(apples: Int) -> Int {
        var m = 0
        if apples % 8 == 0 {
            m = apples / 8
        } else {
            m = apples/8 + 1
        }
        
        return m
    }
    
    func numberOfBoxes1(apples: Int) -> Int {
        var m = 0
        if apples % 8 == 0 {
            m = apples / 8
        } else {
            m = (apples + (8 - apples % 8))/8
        }
        
        return m
    }
    
    
}
