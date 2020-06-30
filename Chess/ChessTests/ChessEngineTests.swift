//
//  ChessEngineTests.swift
//  ChessTests
//
//  Created by Zhijun Sheng on 2020-06-30.
//  Copyright © 2020 Gold Thumb Inc. All rights reserved.
//

import XCTest
@testable import GT_Chess

class ChessEngineTests: XCTestCase {

    func testPrintingEmptyGameBoard() {
        var game = ChessEngine()
        game.initializeGame()
        print(game)
    }

    func testPieceNotAllowedToGoOutOfBoard() {
        var game = ChessEngine()
        game.initializeGame()
        XCTAssertFalse(game.canMovePiece(fromCol: 0, fromRow: 7, toCol: -1, toRow: 7))
        XCTAssertFalse(game.canMovePiece(fromCol: 0, fromRow: 7, toCol: 8, toRow: 7))
        XCTAssertFalse(game.canMovePiece(fromCol: 0, fromRow: 7, toCol: 0, toRow: 8))
        XCTAssertFalse(game.canMovePiece(fromCol: 0, fromRow: 7, toCol: 0, toRow: -1))
    }
    
    func testAvoidCapturingOwnPieces() {
        var game = ChessEngine()
        game.initializeGame()
        XCTAssertFalse(game.canMovePiece(fromCol: 0, fromRow: 7, toCol: 0, toRow: 6))
    }
    
    /*
     
       0 1 2 3 4 5 6 7
     0 . . . . . . . .
     1 . . . . . . . .
     2 . . . . . . . .
     3 . . . . . . . .
     4 . . . . . . . .
     5 . x . . . . . .
     6 . . . . . . . .
     7 . n . . . . . .
     
     */
    func testKnightRules() {
        var game = ChessEngine()
        game.pieces.insert(ChessPiece(col: 1, row: 7, imageName: "", isWhite: true, rank: .knight))
        XCTAssertFalse(game.canMovePiece(fromCol: 1, fromRow: 7, toCol: 1, toRow: 5))
    }
    
    func testRookRules() {
        var game = ChessEngine()
        game.pieces.insert(ChessPiece(col: 0, row: 7, imageName: "", isWhite: true, rank: .rook))
        print(game)
        /*
           0 1 2 3 4 5 6 7
         0 . . . . . . . .
         1 . . . . . . . .
         2 . . . . . . . .
         3 . . . . . . . .
         4 . . . . . . . .
         5 . . . . . . . .
         6 . x . . . . . .
         7 r . . . . . . .
         */
        XCTAssertFalse(game.canMovePiece(fromCol: 0, fromRow: 7, toCol: 1, toRow: 6))
        
        /*
           0 1 2 3 4 5 6 7
         0 . . . . . . . .
         1 . . . . . . . .
         2 . . . . . . . .
         3 . . . . . . . .
         4 . . . . . . . .
         5 o . . . . . . .
         6 . . . . . . . .
         7 r . . . . . . .
         */
        XCTAssertTrue(game.canMovePiece(fromCol: 0, fromRow: 7, toCol: 0, toRow: 5))
    }
}
