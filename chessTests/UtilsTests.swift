//
//  UtilsTests.swift
//  chessTests
//
//  Created by Peter Shi on 2019-06-21.
//  Copyright © 2019 GoldThumb Inc. All rights reserved.
//

import XCTest
@testable import chess

class UtilsTests: XCTestCase {
    
    func testCloserTo() {
//        assume that orgX is 70.0, cellSide is 100.0, margin is 15.0
//
//        let col = xyToColRow(..)
//
//        x     ->   col
//        -----------------
//        71   -> nil
//        86  ->  0
//        150 -> 0
//        160 -> nil
//        180 -> nil
//        186 -> 1
//        280 -> nil
//        287 -> 2
        XCTAssertNil(Utils.xyToColRow(xy: 81, orgXY: 70, side: 100, margin: 15))
        XCTAssertEqual(Utils.xyToColRow(xy: 287, orgXY: 70, side: 100, margin: 15), 2)
        XCTAssertNil(Utils.xyToColRow(xy: 175, orgXY: 70, side: 100, margin: 15))
    }
    
    
    
}
