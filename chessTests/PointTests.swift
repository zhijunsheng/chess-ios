//
//  PointTests.swift
//  chessTests
//
//  Created by Bowen Lin on 2018-01-27.
//  Copyright © 2018 GoldThumb Inc. All rights reserved.
//

import XCTest
@testable import chess

class PointTests: XCTestCase {
    
    
    func testExample() {
//        print("//////////")
        let point = Point(row: 3, col: 5)
        

        
        XCTAssertEqual(3, point.row)
        XCTAssertEqual(5, point.col)
        
        
    }
    
    func testAdd() {
        let sum = add(a: 6, b: 7)
        XCTAssertEqual(13, sum)
    }
    
    func add(a: Int, b: Int) -> Int {
        return a + b
    }
    
    
}
