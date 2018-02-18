//
//  PlayerTest.swift
//  chessTests
//
//  Created by Bowen Lin on 2018-02-17.
//  Copyright © 2018 GoldThumb Inc. All rights reserved.
//

import XCTest
@testable import chess

class PlayerTest: XCTestCase {
    
    func testPlayer() {
        var p: Player = .white
        
        XCTAssertEqual(.black, p.other)
        
        p = .black
        XCTAssertEqual(.white, p.other)
        XCTAssertEqual(.black, p.other.other)
        XCTAssertEqual(.white, p.other.other.other)
    }
    
}
