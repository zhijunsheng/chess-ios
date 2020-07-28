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
        var game = Chess()
        game.initializeGame()
    }
    
    func testPieceNotAllowedToGoOutOfBoard() {
        var game = Chess()
        game.initializeGame()
        game.movePiece(move: Move(0, 1, 0, 2))
        XCTAssertFalse(game.isValid(move: Move(0, 7, -1, 7), isWhite: true))
        XCTAssertFalse(game.isValid(move: Move(0, 7, 8, 7), isWhite: true))
        XCTAssertFalse(game.isValid(move: Move(0, 7, 0, 8), isWhite: true))
        XCTAssertFalse(game.isValid(move: Move(0, 7, 0, -1), isWhite: true))
    }
    
    func testAvoidCapturingOwnPieces() {
        var game = Chess()
        game.initializeGame()
        XCTAssertFalse(game.isValid(move: Move(0, 7, 0, 6), isWhite: true))
    }
    
    func testThreat() {
        /*
         
         + 0 1 2 3 4 5 6 7
         0 R N B Q K B N R
         1 P P P . P P P P
         2 . . . P . . . .
         3 . . . . . p . .
         4 . . . . . . . .
         5 . . . . . . . .
         6 p p p p p . p p
         7 r n b q k b n r
         */
        var game = Chess()
        game.initializeGame()
        
        game.movePiece(move: Move(5, 6, 5, 4))
        game.movePiece(move: Move(3, 1, 3, 2))
        game.movePiece(move: Move(5, 4, 5, 3))
        
        XCTAssertTrue(game.underThreatAt(col: 5, row: 3, enemy: .black))
        
        /*
         
         + 0 1 2 3 4 5 6 7
         0 R . B Q K B N R
         1 P P P P P P P P
         2 N . .  . . . .
         3 . . . . . p . .
         4 . . . . . . . .
         5 . . . . . . . .
         6 p p p p p . p p
         7 r n b q k b n r
         */
        game = Chess()
        game.initializeGame()
        
        game.movePiece(move: Move(5, 6, 5, 4))
        game.movePiece(move: Move(1, 0, 0, 2))
        game.movePiece(move: Move(5, 4, 5, 3))
        
        XCTAssertFalse(game.underThreatAt(col: 5, row: 3, enemy: .black))
        
        /*
         + 0 1 2 3 4 5 6 7
         0 . . . o . . . .
         1 . . . . . . . .
         2 . . . . . . . .
         3 . . . . . . b .
         4 . . . . . . . .
         5 . . . . . . . .
         6 . . . . . . . .
         7 . . . . . . . .
         */
        game = Chess()
        game.pieces.insert(ChessPiece(col: 5, row: 4, imageName: "", isWhite: true, rank: .bishop))
        game.movePiece(fromCol: 5, fromRow: 4, toCol: 6, toRow: 3)
        XCTAssertTrue(game.underThreatAt(col: 3, row: 0, enemy: .white))
    }
    
    func testEmptyAndSafe() {
        /*
         + 0 1 2 3 4 5 6 7
         0 . . . o . . . .
         1 . . . . . . . .
         2 . . . . . . . .
         3 . . . . . . b .
         4 . . . . . . . .
         5 . . . . . . . .
         6 . . . . . . . .
         7 . . . . . . . .
         */
        var game = Chess()
        game.pieces.insert(ChessPiece(col: 5, row: 4, imageName: "", isWhite: true, rank: .bishop))
        game.movePiece(fromCol: 5, fromRow: 4, toCol: 6, toRow: 3)
        XCTAssertFalse(game.emptyAndSafe(row: 0, cols: 1...3, enemy: .white))
    }
}
