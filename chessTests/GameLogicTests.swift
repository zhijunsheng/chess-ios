//
//  GameLogicTests.swift
//  chessTests
//
//  Created by Harry Shen on 11/6/21.
//  Copyright © 2021 GoldThumb Inc. All rights reserved.
//

import XCTest
@testable import chess

class GameLogicTests: XCTestCase {

    func testPrintBoard() {
        var gameLogic = GameLogic()
        gameLogic.restart()
        print(gameLogic)
    }
    
    func testRookMove() {
        var gameLogic = GameLogic()
        var p = ChessPiece(col: 0, row: 0, isBlack: true, pieceType: .rook)
        gameLogic.pieces.insert(p)
        XCTAssertNotNil(gameLogic.rookMove(piece: p, column: 0, row: 1))
        print(gameLogic)
        XCTAssertNil(gameLogic.rookMove(piece: p, column: 1, row: 1))
        XCTAssertNotNil(gameLogic.rookMove(piece: p, column: 1, row: 0))
        print(gameLogic)
    }

}
