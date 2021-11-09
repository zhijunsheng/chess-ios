//
//  ChessEngineTests.swift
//  chessTests
//
//  Created by Felix Lo on 2021-11-09.
//  Copyright © 2021 GoldThumb Inc. All rights reserved.
//

import XCTest
@testable import chess

class ChessEngineTests: XCTestCase {
    
    func testPrintBoard() {
        let board = ChessEngine()
        print(board)
    }
}
