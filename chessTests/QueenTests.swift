//
//  QueenTests.swift
//  chessTests
//
//  Created by Peter Shi on 2020-07-05.
//  Copyright © 2020 GoldThumb Inc. All rights reserved.
//

import XCTest
@testable import chess

class QueenTests: XCTestCase {

    func testQ() {
        let board = Board()
        XCTAssertFalse(board.canQueenMove(fromCol: 0, fromRow: 0, toCol: 1, toRow: 3))
    }

}
