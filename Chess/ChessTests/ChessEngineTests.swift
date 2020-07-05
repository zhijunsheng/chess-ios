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
        XCTAssertFalse(game.canMovePiece(fromCol: 0, fromRow: 7, toCol: -1, toRow: 7, isWhite: true))
        XCTAssertFalse(game.canMovePiece(fromCol: 0, fromRow: 7, toCol: 8, toRow: 7, isWhite: true))
        XCTAssertFalse(game.canMovePiece(fromCol: 0, fromRow: 7, toCol: 0, toRow: 8, isWhite: true))
        XCTAssertFalse(game.canMovePiece(fromCol: 0, fromRow: 7, toCol: 0, toRow: -1, isWhite: true))
    }
    
    func testAvoidCapturingOwnPieces() {
        var game = ChessEngine()
        game.initializeGame()
        XCTAssertFalse(game.canMovePiece(fromCol: 0, fromRow: 7, toCol: 0, toRow: 6, isWhite: true))
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
        var game = ChessEngine()
        game.initializeGame()
        
        game.movePiece(fromCol: 5, fromRow: 6, toCol: 5, toRow: 4)
        game.movePiece(fromCol: 3, fromRow: 1, toCol: 3, toRow: 2)
        game.movePiece(fromCol: 5, fromRow: 4, toCol: 5, toRow: 3)
        
        XCTAssertTrue(game.underThreatAt(col: 5, row: 3, whiteEnemy: false))
        
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
        game = ChessEngine()
        game.initializeGame()
        
        game.movePiece(fromCol: 5, fromRow: 6, toCol: 5, toRow: 4)
        game.movePiece(fromCol: 1, fromRow: 0, toCol: 0, toRow: 2)
        game.movePiece(fromCol: 5, fromRow: 4, toCol: 5, toRow: 3)
        
        XCTAssertFalse(game.underThreatAt(col: 5, row: 3, whiteEnemy: false))
        
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
        game = ChessEngine()
        game.pieces.insert(ChessPiece(col: 5, row: 4, imageName: "", isWhite: true, rank: .bishop))
        game.movePiece(fromCol: 5, fromRow: 4, toCol: 6, toRow: 3)
        XCTAssertTrue(game.underThreatAt(col: 3, row: 0, whiteEnemy: true))
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
        var game = ChessEngine()
        game.pieces.insert(ChessPiece(col: 5, row: 4, imageName: "", isWhite: true, rank: .bishop))
        game.movePiece(fromCol: 5, fromRow: 4, toCol: 6, toRow: 3)
        XCTAssertFalse(game.emptyAndSafe(row: 0, cols: 1...3, whiteEnemy: true))
    }
}
