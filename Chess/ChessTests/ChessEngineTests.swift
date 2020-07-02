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
    
    func testBishopRules() {
        var game = ChessEngine()
        game.pieces.insert(ChessPiece(col: 2, row: 7, imageName: "", isWhite: true, rank: .bishop))
       
        /*
           0 1 2 3 4 5 6 7
         0 . . . . . . . .
         1 . . . . . . . .
         2 . . . . . . . .
         3 . . . . . . . .
         4 . . . . . . . .
         5 . . . x . . . .
         6 . . . . . . . .
         7 . . b . . . . .
         */
        XCTAssertFalse(game.canMovePiece(fromCol: 2, fromRow: 7, toCol: 3, toRow: 5))
        
        /*
           0 1 2 3 4 5 6 7
         0 . . . . . . . .
         1 . . . . . . . .
         2 . . . . . . . .
         3 . . . . . . . .
         4 . . . . . . . .
         5 . . . . x . . .
         6 . . . . . . . .
         7 . . b . . . . .
         */
        XCTAssertTrue(game.canMovePiece(fromCol: 2, fromRow: 7, toCol: 4, toRow: 5))
        
        /*
           0 1 2 3 4 5 6 7
         0 . . . . . . . .
         1 . . . . . . . .
         2 . . . . . . . x
         3 . . . . . . . .
         4 . . . . . . . .
         5 . . . . . . . .
         6 . . . . . . . .
         7 . . b . . . . .
         */
        XCTAssertTrue(game.canMovePiece(fromCol: 2, fromRow: 7, toCol: 7, toRow: 2))
        
        /*
           0 1 2 3 4 5 6 7
         0 . . . . . . . .
         1 . . . . . . . .
         2 . . . . . . . .
         3 . . . . . . . .
         4 . . . . . . . .
         5 . . . . x . . .
         6 . . . p . . . .
         7 . . b . . . . .
         */
        game.pieces.insert(ChessPiece(col: 3, row: 6, imageName: "", isWhite: true, rank: .pawn))
        XCTAssertFalse(game.canMovePiece(fromCol: 2, fromRow: 7, toCol: 4, toRow: 5))
        
        /*
           0 1 2 3 4 5 6 7
         0 . . . . . . . .
         1 . . . . . . . .
         2 . . . . . . . x
         3 . . . . . . . .
         4 . . . . . . . .
         5 . . . . . . . .
         6 . . . p . . . .
         7 . . b . . . . .
         */
        XCTAssertFalse(game.canMovePiece(fromCol: 2, fromRow: 7, toCol: 7, toRow: 2))
        
        game = ChessEngine()
        game.pieces.insert(ChessPiece(col: 3, row: 3, imageName: "", isWhite: true, rank: .bishop))
        /*
           0 1 2 3 4 5 6 7
         0 x . . . . . x .
         1 . n . . . . . .
         2 . . . . n . . .
         3 . . . b . . . .
         4 . . . . . . . .
         5 . n . . . . . .
         6 x . . . . . n .
         7 . . . . . . . x
         */
        game.pieces.insert(ChessPiece(col: 1, row: 1, imageName: "", isWhite: true, rank: .knight))
        game.pieces.insert(ChessPiece(col: 4, row: 2, imageName: "", isWhite: true, rank: .knight))
        game.pieces.insert(ChessPiece(col: 6, row: 6, imageName: "", isWhite: true, rank: .knight))
        game.pieces.insert(ChessPiece(col: 1, row: 5, imageName: "", isWhite: true, rank: .knight))
        XCTAssertFalse(game.canMovePiece(fromCol: 3, fromRow: 3, toCol: 0, toRow: 0))
        XCTAssertFalse(game.canMovePiece(fromCol: 3, fromRow: 3, toCol: 6, toRow: 0))
        XCTAssertFalse(game.canMovePiece(fromCol: 3, fromRow: 3, toCol: 7, toRow: 7))
        XCTAssertFalse(game.canMovePiece(fromCol: 3, fromRow: 3, toCol: 0, toRow: 6))
    }
    
    func testQueenRules() {
        var game = ChessEngine()
        
        /*
           0 1 2 3 4 5 6 7
         0 . . . . . . . .
         1 . . . . . . . .
         2 . . . . . . . .
         3 . . . . . . . .
         4 . . . . . . . .
         5 . . . . . x . .
         6 . . . . . . . .
         7 . . . x . . . .
         */
        XCTAssertFalse(game.canMovePiece(fromCol: 3, fromRow: 7, toCol: 5, toRow: 5))
        
        game.pieces.insert(ChessPiece(col: 3, row: 7, imageName: "", isWhite: true, rank: .queen))
        
        /*
           0 1 2 3 4 5 6 7
         0 . . . . . . . .
         1 . . . . . . . .
         2 . . . . . . . .
         3 . . . . . . . .
         4 . . . . . . . .
         5 . . . . . o . .
         6 . . . . . . . .
         7 . . . q . . . .
         */
        XCTAssertTrue(game.canMovePiece(fromCol: 3, fromRow: 7, toCol: 5, toRow: 5))
        
        /*
           0 1 2 3 4 5 6 7
         0 . . . . . . . .
         1 . . . . . . . .
         2 . . . . . . . .
         3 . . . . . . . .
         4 . . . . . . . .
         5 . . . . x . . .
         6 . . . . . . . .
         7 . . . q . . . .
         */
        XCTAssertFalse(game.canMovePiece(fromCol: 3, fromRow: 7, toCol: 4, toRow: 5))
        
        /*
           0 1 2 3 4 5 6 7
         0 x . . . . . x .
         1 . n . . . . . .
         2 . . . . n . . .
         3 . . . q . . . .
         4 . . . . . . . .
         5 . n . . . . . .
         6 x . . . . . n .
         7 . . . . . . . x
         */
        game = ChessEngine()
        game.pieces.insert(ChessPiece(col: 3, row: 3, imageName: "", isWhite: true, rank: .queen))
        game.pieces.insert(ChessPiece(col: 1, row: 1, imageName: "", isWhite: true, rank: .knight))
        game.pieces.insert(ChessPiece(col: 4, row: 2, imageName: "", isWhite: true, rank: .knight))
        game.pieces.insert(ChessPiece(col: 6, row: 6, imageName: "", isWhite: true, rank: .knight))
        game.pieces.insert(ChessPiece(col: 1, row: 5, imageName: "", isWhite: true, rank: .knight))
        XCTAssertFalse(game.canMovePiece(fromCol: 3, fromRow: 3, toCol: 0, toRow: 0))
        XCTAssertFalse(game.canMovePiece(fromCol: 3, fromRow: 3, toCol: 6, toRow: 0))
        XCTAssertFalse(game.canMovePiece(fromCol: 3, fromRow: 3, toCol: 7, toRow: 7))
        XCTAssertFalse(game.canMovePiece(fromCol: 3, fromRow: 3, toCol: 0, toRow: 6))
    }
    
    func testKingRules() {
        /*
           0 1 2 3 4 5 6 7
         0 . . . . . . . .
         1 . . . . x . . .
         2 . . . . . . . .
         3 . . . k o x . .
         4 . . . . . . . .
         5 . . . . . . . .
         6 . . . . . . . .
         7 . . . . . . . .
         */
        var game = ChessEngine()
        game.pieces.insert(ChessPiece(col: 3, row: 3, imageName: "", isWhite: true, rank: .king))
        XCTAssertFalse(game.canMovePiece(fromCol: 3, fromRow: 3, toCol: 3, toRow: 3))
        XCTAssertFalse(game.canMovePiece(fromCol: 3, fromRow: 3, toCol: 5, toRow: 3))
        XCTAssertTrue(game.canMovePiece(fromCol: 3, fromRow: 3, toCol: 4, toRow: 3))
        XCTAssertFalse(game.canMovePiece(fromCol: 3, fromRow: 3, toCol: 4, toRow: 1))
    }
    
    func testWhitePawnRules() {
        /*
           0 1 2 3 4 5 6 7
         0 . . . . . . . .
         1 . . . . . . . .
         2 . . . . . . . .
         3 . . . . . . . .
         4 . . . . . o . .
         5 . . . . x o x .
         6 . . . . x p x .
         7 . . . . . . . .
         */
        var game = ChessEngine()
        game.pieces.insert(ChessPiece(col: 5, row: 6, imageName: "", isWhite: true, rank: .pawn))
        XCTAssertFalse(game.canMovePiece(fromCol: 5, fromRow: 6, toCol: 6, toRow: 5))
        XCTAssertTrue(game.canMovePiece(fromCol: 5, fromRow: 6, toCol: 5, toRow: 5))
        XCTAssertTrue(game.canMovePiece(fromCol: 5, fromRow: 6, toCol: 5, toRow: 4))
        
        /*
           0 1 2 3 4 5 6 7
         0 . . . . . . . .
         1 . . . . . . . .
         2 . . . . . . . .
         3 . . . . . . . .
         4 . . . . . x . .
         5 . . . . . N . .
         6 . . . . . p . .
         7 . . . . . . . .
         */
        game = ChessEngine()
        game.pieces.insert(ChessPiece(col: 5, row: 6, imageName: "", isWhite: true, rank: .pawn))
        game.pieces.insert(ChessPiece(col: 5, row: 5, imageName: "", isWhite: false, rank: .knight))
        XCTAssertFalse(game.canMovePiece(fromCol: 5, fromRow: 6, toCol: 5, toRow: 5))
        XCTAssertFalse(game.canMovePiece(fromCol: 5, fromRow: 6, toCol: 5, toRow: 4))
        
        /*
           0 1 2 3 4 5 6 7
         0 . . . . . . . .
         1 . . . . . . . .
         2 . . . . . . . .
         3 . . . . . . . .
         4 . . . . . N . .
         5 . . . . . . . .
         6 . . . . . p . .
         7 . . . . . . . .
         */
        game = ChessEngine()
        game.pieces.insert(ChessPiece(col: 5, row: 6, imageName: "", isWhite: true, rank: .pawn))
        game.pieces.insert(ChessPiece(col: 5, row: 4, imageName: "", isWhite: false, rank: .knight))
        XCTAssertTrue(game.canMovePiece(fromCol: 5, fromRow: 6, toCol: 5, toRow: 5))
        XCTAssertFalse(game.canMovePiece(fromCol: 5, fromRow: 6, toCol: 5, toRow: 4))
        
        /*
           0 1 2 3 4 5 6 7
         0 . . . . . . . .
         1 . . . . . . . .
         2 . . . . . . . .
         3 . . . . x o x .
         4 . . . . x p x .
         5 . . . . x x x .
         6 . . . . . . . .
         7 . . . . . . . .
         */
        game = ChessEngine()
        game.pieces.insert(ChessPiece(col: 5, row: 4, imageName: "", isWhite: true, rank: .pawn))
        XCTAssertTrue(game.canMovePiece(fromCol: 5, fromRow: 4, toCol: 5, toRow: 3))
        XCTAssertFalse(game.canMovePiece(fromCol: 5, fromRow: 4, toCol: 4, toRow: 3))
        XCTAssertFalse(game.canMovePiece(fromCol: 5, fromRow: 4, toCol: 4, toRow: 4))
        XCTAssertFalse(game.canMovePiece(fromCol: 5, fromRow: 4, toCol: 4, toRow: 5))
        XCTAssertFalse(game.canMovePiece(fromCol: 5, fromRow: 4, toCol: 5, toRow: 5))
        XCTAssertFalse(game.canMovePiece(fromCol: 5, fromRow: 4, toCol: 6, toRow: 5))
        XCTAssertFalse(game.canMovePiece(fromCol: 5, fromRow: 4, toCol: 6, toRow: 4))
        XCTAssertFalse(game.canMovePiece(fromCol: 5, fromRow: 4, toCol: 6, toRow: 3))
        
        /*
           0 1 2 3 4 5 6 7
         0 . . . . . . . .
         1 . . . . . . . .
         2 . . . . . . . .
         3 . . . . . N . .
         4 . . . . . p . .
         5 . . . . . . . .
         6 . . . . . . . .
         7 . . . . . . . .
         */
        game = ChessEngine()
        game.pieces.insert(ChessPiece(col: 5, row: 4, imageName: "", isWhite: true, rank: .pawn))
        game.pieces.insert(ChessPiece(col: 5, row: 3, imageName: "", isWhite: false, rank: .knight))
        XCTAssertFalse(game.canMovePiece(fromCol: 5, fromRow: 4, toCol: 5, toRow: 3))
        
        /*
           0 1 2 3 4 5 6 7
         0 . . . . . . . .
         1 . . . . . . . .
         2 . . . . . x . .
         3 . . . . . . . .
         4 . . . . . p . .
         5 . . . . . . . .
         6 . . . . . . . .
         7 . . . . . . . .
         */
        game = ChessEngine()
        game.pieces.insert(ChessPiece(col: 5, row: 4, imageName: "", isWhite: true, rank: .pawn))
        XCTAssertFalse(game.canMovePiece(fromCol: 5, fromRow: 4, toCol: 5, toRow: 2))
        
        /*
           0 1 2 3 4 5 6 7
         0 . . . . . . . .
         1 . . . . . . . .
         2 . . . . . . . .
         3 . . . . N . N .
         4 . . . . . p . .
         5 . . . . . . . .
         6 . . . . . . . .
         7 . . . . . . . .
         */
        game = ChessEngine()
        game.pieces.insert(ChessPiece(col: 5, row: 4, imageName: "", isWhite: true, rank: .pawn))
        game.pieces.insert(ChessPiece(col: 4, row: 3, imageName: "", isWhite: false, rank: .knight))
        game.pieces.insert(ChessPiece(col: 6, row: 3, imageName: "", isWhite: false, rank: .knight))
        XCTAssertTrue(game.canMovePiece(fromCol: 5, fromRow: 4, toCol: 4, toRow: 3))
        XCTAssertTrue(game.canMovePiece(fromCol: 5, fromRow: 4, toCol: 6, toRow: 3))
    }
    
    func testBlackPawnRules() {
        /*
           0 1 2 3 4 5 6 7
         0 . . . . . . . .
         1 . . . . . P . .
         2 . . . . . o x .
         3 . . . . . o . .
         4 . . . . . . . .
         5 . . . . . . . .
         6 . . . . . . . .
         7 . . . . . . . .
         */
        var game = ChessEngine()
        game.whitesTurn = false
        game.pieces.insert(ChessPiece(col: 5, row: 1, imageName: "", isWhite: false, rank: .pawn))
        XCTAssertFalse(game.canMovePiece(fromCol: 5, fromRow: 1, toCol: 6, toRow: 2))
        XCTAssertTrue(game.canMovePiece(fromCol: 5, fromRow: 1, toCol: 5, toRow: 2))
        XCTAssertTrue(game.canMovePiece(fromCol: 5, fromRow: 1, toCol: 5, toRow: 3))
        
        /*
           0 1 2 3 4 5 6 7
         0 . . . . . . . .
         1 . . . . . P . .
         2 . . . . . n . .
         3 . . . . . x . .
         4 . . . . . . . .
         5 . . . . . . . .
         6 . . . . . . . .
         7 . . . . . . . .
         */
        game = ChessEngine()
        game.whitesTurn = false
        game.pieces.insert(ChessPiece(col: 5, row: 1, imageName: "", isWhite: false, rank: .pawn))
        game.pieces.insert(ChessPiece(col: 5, row: 2, imageName: "", isWhite: true, rank: .knight))
        XCTAssertFalse(game.canMovePiece(fromCol: 5, fromRow: 1, toCol: 5, toRow: 2))
        XCTAssertFalse(game.canMovePiece(fromCol: 5, fromRow: 1, toCol: 5, toRow: 3))
        
        /*
           0 1 2 3 4 5 6 7
         0 . . . . . . . .
         1 . . . . . P . .
         2 . . . . . . . .
         3 . . . . . n . .
         4 . . . . . . . .
         5 . . . . . . . .
         6 . . . . . . . .
         7 . . . . . . . .
         */
        game = ChessEngine()
        game.whitesTurn = false
        game.pieces.insert(ChessPiece(col: 5, row: 1, imageName: "", isWhite: false, rank: .pawn))
        game.pieces.insert(ChessPiece(col: 5, row: 3, imageName: "", isWhite: true, rank: .knight))
        XCTAssertTrue(game.canMovePiece(fromCol: 5, fromRow: 1, toCol: 5, toRow: 2))
        XCTAssertFalse(game.canMovePiece(fromCol: 5, fromRow: 1, toCol: 5, toRow: 3))
        
        /*
           0 1 2 3 4 5 6 7
         0 . . . . . . . .
         1 . . . . . . . .
         2 . . . . . . . .
         3 . . . . x x x .
         4 . . . . x P x .
         5 . . . . x o x .
         6 . . . . . . . .
         7 . . . . . . . .
         */
        game = ChessEngine()
        game.whitesTurn = false
        game.pieces.insert(ChessPiece(col: 5, row: 4, imageName: "", isWhite: false, rank: .pawn))
        XCTAssertTrue(game.canMovePiece(fromCol: 5, fromRow: 4, toCol: 5, toRow: 5))
        XCTAssertFalse(game.canMovePiece(fromCol: 5, fromRow: 4, toCol: 4, toRow: 3))
        XCTAssertFalse(game.canMovePiece(fromCol: 5, fromRow: 4, toCol: 4, toRow: 4))
        XCTAssertFalse(game.canMovePiece(fromCol: 5, fromRow: 4, toCol: 4, toRow: 5))
        XCTAssertFalse(game.canMovePiece(fromCol: 5, fromRow: 4, toCol: 5, toRow: 3))
        XCTAssertFalse(game.canMovePiece(fromCol: 5, fromRow: 4, toCol: 6, toRow: 5))
        XCTAssertFalse(game.canMovePiece(fromCol: 5, fromRow: 4, toCol: 6, toRow: 4))
        XCTAssertFalse(game.canMovePiece(fromCol: 5, fromRow: 4, toCol: 6, toRow: 3))
        
        /*
           0 1 2 3 4 5 6 7
         0 . . . . . . . .
         1 . . . . . . . .
         2 . . . . . . . .
         3 . . . . . P . .
         4 . . . . . n . .
         5 . . . . . . . .
         6 . . . . . . . .
         7 . . . . . . . .
         */
        game = ChessEngine()
        game.whitesTurn = false
        game.pieces.insert(ChessPiece(col: 5, row: 3, imageName: "", isWhite: false, rank: .pawn))
        game.pieces.insert(ChessPiece(col: 5, row: 4, imageName: "", isWhite: true, rank: .knight))
        XCTAssertFalse(game.canMovePiece(fromCol: 5, fromRow: 3, toCol: 5, toRow: 4))
        
        /*
           0 1 2 3 4 5 6 7
         0 . . . . . . . .
         1 . . . . . . . .
         2 . . . . . P . .
         3 . . . . n . n .
         4 . . . . . . . .
         5 . . . . . . . .
         6 . . . . . . . .
         7 . . . . . . . .
         */
        game = ChessEngine()
        game.whitesTurn = false
        game.pieces.insert(ChessPiece(col: 5, row: 2, imageName: "", isWhite: false, rank: .pawn))
        game.pieces.insert(ChessPiece(col: 4, row: 3, imageName: "", isWhite: true, rank: .knight))
        game.pieces.insert(ChessPiece(col: 6, row: 3, imageName: "", isWhite: true, rank: .knight))
        XCTAssertTrue(game.canMovePiece(fromCol: 5, fromRow: 2, toCol: 4, toRow: 3))
        XCTAssertTrue(game.canMovePiece(fromCol: 5, fromRow: 2, toCol: 6, toRow: 3))
        
        /*
          0 1 2 3 4 5 6 7
        0 . . . . . . . .
        1 . . P . . . . .
        2 . . . p . . . .
        3 . . . . . . . .
        4 . . . . . . . .
        5 . . . . . . . .
        6 . . . . . . . .
        7 . . . . . . . .
        */
        game = ChessEngine()
        game.whitesTurn = false
        game.pieces.insert(ChessPiece(col: 2, row: 1, imageName: "", isWhite: false, rank: .pawn))
        game.pieces.insert(ChessPiece(col: 3, row: 2, imageName: "", isWhite: true, rank: .pawn))
        XCTAssertTrue(game.canMovePiece(fromCol: 2, fromRow: 1, toCol: 3, toRow: 2))
    }
    
    func testWhiteEnPassant() {
        /*
          0 1 2 3 4 5 6 7
        0 . . . . . . . .
        1 . . . . . . . .
        2 . . . . o . . .
        3 . . . . P p . .
        4 . . . . . . . .
        5 . . . . . . . .
        6 . . . . . . . .
        7 . . . . . . . .
        */
        var game = ChessEngine()
        game.pieces.insert(ChessPiece(col: 5, row: 3, imageName: "", isWhite: true, rank: .pawn))
        game.pieces.insert(ChessPiece(col: 4, row: 3, imageName: "", isWhite: false, rank: .pawn))
        game.lastMove = ChessMove(fromCol: 4, fromRow: 1, toCol: 4, toRow: 3)
        XCTAssertTrue(game.canMovePiece(fromCol: 5, fromRow: 3, toCol: 4, toRow: 2))
        
        XCTAssertNotNil(game.pieceAt(col: 4, row: 3))
        game.movePiece(fromCol: 5, fromRow: 3, toCol: 4, toRow: 2)
        XCTAssertNil(game.pieceAt(col: 4, row: 3))
        XCTAssertNotNil(game.pieceAt(col: 4, row: 2))
        
        /*

           0 1 2 3 4 5 6 7
         0 R N B Q K B N R
         1 P P P P P P P P
         2 . . . . . . . .
         3 . . . . . . . .
         4 . . . . . p . .
         5 . . . . . . . .
         6 p p p p p . p p
         7 r n b q k b n r
         
           0 1 2 3 4 5 6 7
         0 R . B Q K B N R
         1 P P P P P P P P
         2 N . . . . . . .
         3 . . . . . . . .
         4 . . . . . p . .
         5 . . . . . . . .
         6 p p p p p . p p
         7 r n b q k b n r
         
           0 1 2 3 4 5 6 7
         0 R . B Q K B N R
         1 P P P P P P P P
         2 N . . . . . . .
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
        
        XCTAssertNotNil(game.pieceAt(col: 0, row: 2))
        
        /*

           0 1 2 3 4 5 6 7
         0 R N B Q K B N R
         1 P P P P P P P P
         2 . . . . . . . .
         3 . . . . . . . .
         4 . . . . . p . .
         5 . . . . . . . .
         6 p p p p p . p p
         7 r n b q k b n r
         
           0 1 2 3 4 5 6 7
         0 R . B Q K B N R
         1 P P P P P P P P
         2 N . . . . . . .
         3 . . . . . . . .
         4 . . . . . p . .
         5 . . . . . . . .
         6 p p p p p . p p
         7 r n b q k b n r
         
           0 1 2 3 4 5 6 7
         0 R . B Q K B N R
         1 P P P P P P P P
         2 N . . . . . . .
         3 . . . . . p . .
         4 . . . . . . . .
         5 . . . . . . . .
         6 p p p p p . p p
         7 r n b q k b n r
         
           0 1 2 3 4 5 6 7
         0 R . B Q K B N R
         1 P P P P . P P P
         2 N . . . . . . .
         3 . . . . P p . .
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
        game.movePiece(fromCol: 4, fromRow: 1, toCol: 4, toRow: 3)
        
        XCTAssertNotNil(game.pieceAt(col: 0, row: 2))
        XCTAssertNotNil(game.pieceAt(col: 5, row: 3))
    }
}
