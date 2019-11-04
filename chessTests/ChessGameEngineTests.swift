//
//  ChessGameEngineTests.swift
//  chessTests
//
//  Created by Elaine on 2019/10/27.
//  Copyright © 2019 GoldThumb Inc. All rights reserved.
//

import XCTest
@testable import chess

class ChessGameEngineTests: XCTestCase {
    func testPrintingChessBoard() {
        let engine = ChessGameEngine()
        print(engine)
    }
}
