//
//  KingTests.swift
//  ChessTests
//
//  Created by Zhijun Sheng on 2020-07-05.
//  Copyright © 2020 Gold Thumb Inc. All rights reserved.
//

import XCTest
@testable import GT_Chess

class KingTests: XCTestCase {
    
    func testKingRules() {
        /*
         + 0 1 2 3 4 5 6 7
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
        XCTAssertFalse(game.isValid(fromCol: 3, fromRow: 3, toCol: 3, toRow: 3, isWhite: true))
        XCTAssertFalse(game.isValid(fromCol: 3, fromRow: 3, toCol: 5, toRow: 3, isWhite: true))
        XCTAssertTrue(game.isValid(fromCol: 3, fromRow: 3, toCol: 4, toRow: 3, isWhite: true))
        XCTAssertFalse(game.isValid(fromCol: 3, fromRow: 3, toCol: 4, toRow: 1, isWhite: true))
        
        /*
         + 0 1 2 3 4 5 6 7
         0 R N B Q K B N R
         1 P P P P P P P P
         2 . . . . . . . .
         3 . . . . . . . .
         4 . . . . . . . .
         5 . . . . . . . .
         6 p p p p p p p p
         7 r n b q k b n r
         */
        game = ChessEngine()
        game.initializeGame()
        XCTAssertFalse(game.isValid(fromCol: 4, fromRow: 7, toCol: 4, toRow: 8, isWhite: true))
    }
    
    func testWhiteKingSideCanCastle() {
        var game = ChessEngine()
        game.initializeGame()
        
        /*
         + 0 1 2 3 4 5 6 7
         0 R N B Q K B N R
         1 P P P P P P P P
         2 . . . . . . . .
         3 . . . . . . . .
         4 . . . . . . . .
         5 . . . . p . . .
         6 p p p p . p p p
         7 r n b q k b n r
         */
        game.movePiece(fromCol: 4, fromRow: 6, toCol: 4, toRow: 5)
        
        /*
         + 0 1 2 3 4 5 6 7
         0 R N B Q K B N R
         1 . P P P P P P P
         2 P . . . . . . .
         3 . . . . . . . .
         4 . . . . . . . .
         5 . . . . p . . .
         6 p p p p . p p p
         7 r n b q k b n r
         */
        game.movePiece(fromCol: 0, fromRow: 1, toCol: 0, toRow: 2)
        
        /*
         + 0 1 2 3 4 5 6 7
         0 R N B Q K B N R
         1 . P P P P P P P
         2 P . . . . . . .
         3 . . . . . . . .
         4 . . . . . . . .
         5 . . . . p . . .
         6 p p p p b p p p
         7 r n b q k . n r
         */
        game.movePiece(fromCol: 5, fromRow: 7, toCol: 4, toRow: 6)
        
        /*
         + 0 1 2 3 4 5 6 7
         0 R N B Q K B N R
         1 . . P P P P P P
         2 P P . . . . . .
         3 . . . . . . . .
         4 . . . . . . . .
         5 . . . . p . . .
         6 p p p p b p p p
         7 r n b q k . n r
         */
        game.movePiece(fromCol: 1, fromRow: 1, toCol: 1, toRow: 2)
        
        /*
         + 0 1 2 3 4 5 6 7
         0 R N B Q K B N R
         1 . . P P P P P P
         2 P P . . . . . .
         3 . . . . . . . .
         4 . . . . . . . .
         5 . . . . p . . n
         6 p p p p b p p p
         7 r n b q k . . r
         */
        game.movePiece(fromCol: 6, fromRow: 7, toCol: 7, toRow: 5)
        
        /*
         + 0 1 2 3 4 5 6 7
         0 R N B Q K B N R
         1 . . . P P P P P
         2 P P P . . . . .
         3 . . . . . . . .
         4 . . . . . . . .
         5 . . . . p . . n
         6 p p p p b p p p
         7 r n b q k . . r
         */
        game.movePiece(fromCol: 2, fromRow: 1, toCol: 2, toRow: 2)
        XCTAssertTrue(game.canCastle(toCol: 6, toRow: 7))
        
        /*
         + 0 1 2 3 4 5 6 7
         0 R N B Q K B N R
         1 . . . . . P P P
         2 P P P P P . . .
         3 . . . . . . . .
         4 . . . . . . . .
         5 . . . . p . . n
         6 p p p p b p p p
         7 r n b q k . . r
         */
        game.movePiece(fromCol: 2, fromRow: 1, toCol: 2, toRow: 2)
        game.movePiece(fromCol: 4, fromRow: 7, toCol: 5, toRow: 7)
        game.movePiece(fromCol: 3, fromRow: 1, toCol: 3, toRow: 2)
        game.movePiece(fromCol: 5, fromRow: 7, toCol: 4, toRow: 7)
        game.movePiece(fromCol: 4, fromRow: 1, toCol: 4, toRow: 2)
        XCTAssertFalse(game.canCastle(toCol: 6, toRow: 7))
    }
    
    func testWhiteQueenSideCastling() {
        var game = ChessEngine()
        game.initializeGame()
        
        /*
         + 0 1 2 3 4 5 6 7
         0 R N B Q K B N R
         1 . . . . . P P P
         2 P P P P P . . .
         3 . . . . . . . .
         4 . . p . .  . .
         5 n q . p . . . .
         6 p p . b p p p p
         7 r . . . k b n r
         */
        game.movePiece(fromCol: 2, fromRow: 6, toCol: 2, toRow: 4) // white pawn
        game.movePiece(fromCol: 0, fromRow: 1, toCol: 0, toRow: 2) // black pawn
        game.movePiece(fromCol: 3, fromRow: 7, toCol: 1, toRow: 5) // white queen
        game.movePiece(fromCol: 1, fromRow: 1, toCol: 1, toRow: 2) // black pawn
        game.movePiece(fromCol: 1, fromRow: 7, toCol: 0, toRow: 5) // white knight
        game.movePiece(fromCol: 2, fromRow: 1, toCol: 2, toRow: 2) // black pawn
        game.movePiece(fromCol: 3, fromRow: 6, toCol: 3, toRow: 5) // white pawn
        game.movePiece(fromCol: 3, fromRow: 1, toCol: 3, toRow: 2) // black pawn
        game.movePiece(fromCol: 2, fromRow: 7, toCol: 3, toRow: 6) // white bishop
        game.movePiece(fromCol: 4, fromRow: 1, toCol: 4, toRow: 2) // black pawn
        XCTAssertTrue(game.canCastle(toCol: 2, toRow: 7))
        
        /*
         + 0 1 2 3 4 5 6 7
         0 R N B Q K B N R
         1 . . . . . P P P
         2 P P P P P . . .
         3 . . . . . . . .
         4 . . p . .  . .
         5 n q . p . . . .
         6 p p . b p p p p
         7 r . . . k b n r
         */
        XCTAssertNil(game.pieceAt(col: 1, row: 7))
        XCTAssertNil(game.pieceAt(col: 2, row: 7))
        XCTAssertNil(game.pieceAt(col: 3, row: 7))
        XCTAssertNotNil(game.pieceAt(col: 0, row: 7))
        XCTAssertNotNil(game.pieceAt(col: 4, row: 7))
        game.movePiece(fromCol: 4, fromRow: 7, toCol: 2, toRow: 7)
        XCTAssertNil(game.pieceAt(col: 1, row: 7))
        XCTAssertNotNil(game.pieceAt(col: 2, row: 7)) // king
        XCTAssertNotNil(game.pieceAt(col: 3, row: 7)) // rook
        XCTAssertNil(game.pieceAt(col: 0, row: 7))
        XCTAssertNil(game.pieceAt(col: 4, row: 7))
    }
    
    func testWhiteKingSideCastling() {
        var game = ChessEngine()
        game.initializeGame()
        
        /*
         + 0 1 2 3 4 5 6 7
         0 R N B Q K B N R
         1 P P P P P P P P
         2 . . . . . . . .
         3 . . . . . . . .
         4 . . . . . . . .
         5 . . . . p . . .
         6 p p p p . p p p
         7 r n b q k b n r
         */
        game.movePiece(fromCol: 4, fromRow: 6, toCol: 4, toRow: 5)
        
        /*
         + 0 1 2 3 4 5 6 7
         0 R N B Q K B N R
         1 . P P P P P P P
         2 P . . . . . . .
         3 . . . . . . . .
         4 . . . . . . . .
         5 . . . . p . . .
         6 p p p p . p p p
         7 r n b q k b n r
         */
        game.movePiece(fromCol: 0, fromRow: 1, toCol: 0, toRow: 2)
        
        /*
         + 0 1 2 3 4 5 6 7
         0 R N B Q K B N R
         1 . P P P P P P P
         2 P . . . . . . .
         3 . . . . . . . .
         4 . . . . . . . .
         5 . . . . p . . .
         6 p p p p b p p p
         7 r n b q k . n r
         */
        game.movePiece(fromCol: 5, fromRow: 7, toCol: 4, toRow: 6)
        
        /*
         + 0 1 2 3 4 5 6 7
         0 R N B Q K B N R
         1 . . P P P P P P
         2 P P . . . . . .
         3 . . . . . . . .
         4 . . . . . . . .
         5 . . . . p . . .
         6 p p p p b p p p
         7 r n b q k . n r
         */
        game.movePiece(fromCol: 1, fromRow: 1, toCol: 1, toRow: 2)
        
        /*
         + 0 1 2 3 4 5 6 7
         0 R N B Q K B N R
         1 . . P P P P P P
         2 P P . . . . . .
         3 . . . . . . . .
         4 . . . . . . . .
         5 . . . . p . . n
         6 p p p p b p p p
         7 r n b q k . . r
         */
        game.movePiece(fromCol: 6, fromRow: 7, toCol: 7, toRow: 5)
        
        /*
         + 0 1 2 3 4 5 6 7
         0 R N B Q K B N R
         1 . . . P P P P P
         2 P P P . . . . .
         3 . . . . . . . .
         4 . . . . . . . .
         5 . . . . p . . n
         6 p p p p b p p p
         7 r n b q k . . r
         */
        game.movePiece(fromCol: 2, fromRow: 1, toCol: 2, toRow: 2)
        XCTAssertTrue(game.canCastle(toCol: 6, toRow: 7))
        
        /*
         + 0 1 2 3 4 5 6 7
         0 R N B Q K B N R
         1 . . . . . P P P
         2 P P P P P . . .
         3 . . . . . . . .
         4 . . . . . . . .
         5 . . . . p . . n
         6 p p p p b p p p
         7 r n b q k . . r
         */
        game.movePiece(fromCol: 2, fromRow: 1, toCol: 2, toRow: 2)
        game.movePiece(fromCol: 4, fromRow: 7, toCol: 5, toRow: 7)
        game.movePiece(fromCol: 3, fromRow: 1, toCol: 3, toRow: 2)
        game.movePiece(fromCol: 5, fromRow: 7, toCol: 4, toRow: 7)
        game.movePiece(fromCol: 4, fromRow: 1, toCol: 4, toRow: 2)
        XCTAssertFalse(game.canCastle(toCol: 6, toRow: 7))
        
        
        /*
         + 0 1 2 3 4 5 6 7
         0 R N B Q K B N R
         1 . . . P P P P P
         2 P P P . . . . .
         3 . . . . . . . .
         4 . . . . . . . .
         5 . . . . p . . n
         6 p p p p b p p p
         7 r n b q . r k .
         */
        XCTAssertNotNil(game.pieceAt(col: 7, row: 7))
        XCTAssertNil(game.pieceAt(col: 6, row: 7))
        XCTAssertNil(game.pieceAt(col: 5, row: 7))
        game.movePiece(fromCol: 4, fromRow: 7, toCol: 6, toRow: 7)
        XCTAssertNotNil(game.pieceAt(col: 6, row: 7))
        XCTAssertNil(game.pieceAt(col: 7, row: 7))
        XCTAssertNotNil(game.pieceAt(col: 5, row: 7))
        
        /*
         + 0 1 2 3 4 5 6 7
         0 R N B Q K B N R
         1 . . . . . . P P
         2 P P P P P P . .
         3 . . . . . . . .
         4 . . . . . . . .
         5 . . . p . n p b
         6 p p p k p p . p
         7 r n b . q . . r
         */
        game = ChessEngine()
        game.initializeGame()
        game.movePiece(fromCol: 3, fromRow: 6, toCol: 3, toRow: 5) // pawn
        game.movePiece(fromCol: 0, fromRow: 1, toCol: 0, toRow: 2)
        game.movePiece(fromCol: 4, fromRow: 7, toCol: 3, toRow: 6) // king
        game.movePiece(fromCol: 1, fromRow: 1, toCol: 1, toRow: 2)
        game.movePiece(fromCol: 6, fromRow: 7, toCol: 5, toRow: 5) // knight
        game.movePiece(fromCol: 2, fromRow: 1, toCol: 2, toRow: 2)
        game.movePiece(fromCol: 6, fromRow: 6, toCol: 6, toRow: 5) // pawn
        game.movePiece(fromCol: 3, fromRow: 1, toCol: 3, toRow: 2)
        game.movePiece(fromCol: 5, fromRow: 7, toCol: 7, toRow: 5) // bishop
        game.movePiece(fromCol: 4, fromRow: 1, toCol: 4, toRow: 2)
        game.movePiece(fromCol: 3, fromRow: 7, toCol: 4, toRow: 7) // queen
        game.movePiece(fromCol: 5, fromRow: 1, toCol: 5, toRow: 2)
        XCTAssertFalse(game.canCastle(toCol: 6, toRow: 7))
        
        XCTAssertNotNil(game.pieceAt(col: 7, row: 7))
        XCTAssertNil(game.pieceAt(col: 6, row: 7))
        XCTAssertNil(game.pieceAt(col: 5, row: 7))
        game.movePiece(fromCol: 4, fromRow: 7, toCol: 6, toRow: 7)
        XCTAssertNotNil(game.pieceAt(col: 6, row: 7)) // queen
        XCTAssertNotNil(game.pieceAt(col: 7, row: 7))
        XCTAssertNil(game.pieceAt(col: 5, row: 7))
    }
    
    func testBlackKingSideCastling() {
        var game = ChessEngine()
        game.initializeGame()
        
        /*
         + 0 1 2 3 4 5 6 7
         0 R N B Q K B N R
         1 P P P P P P P P
         2 . . . . . . . .
         3 . . . . . . . .
         4 . . . . . . . .
         5 . . . . p . . .
         6 p p p p . p p p
         7 r n b q k b n r
         */
        game.movePiece(fromCol: 4, fromRow: 6, toCol: 4, toRow: 5)
        
        /*
         + 0 1 2 3 4 5 6 7
         0 R N B Q K B N R
         1 P P P P . P P P
         2 . . . . P . . .
         3 . . . . . . . .
         4 . . . . . . . .
         5 . . . . . . . .
         6 p p p p p p p p
         7 r n b q k b n r
         */
        game.movePiece(fromCol: 4, fromRow: 1, toCol: 4, toRow: 2)
        
        /*
         + 0 1 2 3 4 5 6 7
         0 R N B Q K B N R
         1 P P P P . P P P
         2 . . . . P . . .
         3 . . . . . . . .
         4 . . . . . . . .
         5 . . . . p p . .
         6 p p p p . . p p
         7 r n b q k b n r
         */
        game.movePiece(fromCol: 5, fromRow: 6, toCol: 5, toRow: 5)
        
        /*
         + 0 1 2 3 4 5 6 7
         0 R N B Q K . N R
         1 P P P P B P P P
         2 . . . . P . . .
         3 . . . . . . . .
         4 . . . . . . . .
         5 . . . . p p . .
         6 p p p p . . p p
         7 r n b q k b n r
         */
        game.movePiece(fromCol: 5, fromRow: 0, toCol: 4, toRow: 1)
        
        /*
         + 0 1 2 3 4 5 6 7
         0 R N B Q K . N R
         1 P P P P B P P P
         2 . . . . P . . .
         3 . . . . . . . .
         4 . . . . . . . .
         5 . . . . p p p .
         6 p p p p . . . p
         7 r n b q k b n r
         */
        game.movePiece(fromCol: 6, fromRow: 6, toCol: 6, toRow: 5)
        
        /*
         + 0 1 2 3 4 5 6 7
         0 R N B Q K . . R
         1 P P P P B P P P
         2 . . . . P . . N
         3 . . . . . . . .
         4 . . . . . . . .
         5 . . . . p p p .
         6 p p p p . . . p
         7 r n b q k b n r
         */
        game.movePiece(fromCol: 6, fromRow: 0, toCol: 7, toRow: 2)
        
        /*
         + 0 1 2 3 4 5 6 7
         0 R N B Q K . . R
         1 P P P P B P P P
         2 . . . . P . . N
         3 . . . . . . . .
         4 . . . . . . . .
         5 . . . . p p p p
         6 p p p p . . . .
         7 r n b q k b n r
         */
        game.movePiece(fromCol: 7, fromRow: 6, toCol: 7, toRow: 5)
        XCTAssertTrue(game.canCastle(toCol: 6, toRow: 0))
        
        /*
         + 0 1 2 3 4 5 6 7
         0 R N B Q K . . R
         1 P P P P B P P P
         2 . . . . P . . N
         3 . . . . . . . .
         4 . . . . . . . .
         5 . . p p p p p p
         6 p p . . . . . .
         7 r n b q k b n r
         */
        game.movePiece(fromCol: 4, fromRow: 0, toCol: 5, toRow: 0)
        game.movePiece(fromCol: 3, fromRow: 6, toCol: 3, toRow: 5)
        game.movePiece(fromCol: 5, fromRow: 0, toCol: 4, toRow: 0)
        game.movePiece(fromCol: 2, fromRow: 6, toCol: 2, toRow: 5)
        XCTAssertFalse(game.canCastle(toCol: 6, toRow: 0))
        
        /*
         + 0 1 2 3 4 5 6 7
         0 R N B Q . R K .
         1 P P P P B P P P
         2 . . . . P . . N
         3 . . . . . . . .
         4 . . . . . . . .
         5 . . . . p p p p
         6 p p p p . . . .
         7 r n b q k b n r
         */
        XCTAssertNotNil(game.pieceAt(col: 7, row: 0))
        XCTAssertNil(game.pieceAt(col: 6, row: 0))
        XCTAssertNil(game.pieceAt(col: 5, row: 0))
        game.movePiece(fromCol: 4, fromRow: 0, toCol: 6, toRow: 0)
        XCTAssertNotNil(game.pieceAt(col: 6, row: 0))
        XCTAssertNil(game.pieceAt(col: 7, row: 0))
        XCTAssertNotNil(game.pieceAt(col: 5, row: 0))
    }
    
    func testKingThreatenedByPawn() {
        /*
         + 0 1 2 3 4 5 6 7
         0 R N B Q K B N R
         1 P P P P P P P P
         2 . . . . . . . .
         3 . . . . . . . .
         4 . . . . . . . .
         5 . . . . . . . .
         6 p p p p p p p p
         7 r n b q k b n r
         */
        var game = ChessEngine()
        game.initializeGame()
        
        /*
         + 0 1 2 3 4 5 6 7
         0 R N B Q K B N R
         1 P P P P P P P P
         2 . . . . . . . .
         3 . . . . . . . .
         4 . . . . p . . .
         5 . . . . . . . .
         6 p p p p . p p p
         7 r n b q k b n r
         */
        game.movePiece(fromCol: 4, fromRow: 6, toCol: 4, toRow: 4)
        
        /*
         + 0 1 2 3 4 5 6 7
         0 R N B Q K B N R
         1 P P P P P . P P
         2 . . . . . . . .
         3 . . . . . P . .
         4 . . . . p . . .
         5 . . . . . . . .
         6 p p p p . p p p
         7 r n b q k b n r
         */
        game.movePiece(fromCol: 5, fromRow: 1, toCol: 5, toRow: 3)
        
        /*
         + 0 1 2 3 4 5 6 7
         0 R N B Q K B N R
         1 P P P P P . P P
         2 . . . . . . . .
         3 . . . . . P . .
         4 . . . . p . . .
         5 . . . . . . . .
         6 p p p p k p p p
         7 r n b q . b n r
         */
        game.movePiece(fromCol: 4, fromRow: 7, toCol: 4, toRow: 6)
        
        /*
         + 0 1 2 3 4 5 6 7
         0 R N B Q K B N R
         1 P P P P P . P P
         2 . . . . . . . .
         3 . . . . . . . .
         4 . . . . p P . .
         5 . . . . . . . .
         6 p p p p k p p p
         7 r n b q . b n r
         */
        game.movePiece(fromCol: 5, fromRow: 3, toCol: 5, toRow: 4)
        XCTAssertFalse(game.isValid(fromCol: 4, fromRow: 6, toCol: 4, toRow: 5, isWhite: true))
        XCTAssertTrue(game.isValid(fromCol: 4, fromRow: 6, toCol: 5, toRow: 5, isWhite: true))
    }
    
    func testKingCapturingUnderThreat() {
        var game = ChessEngine()
        game.initializeGame()
        
        /*
         + 0 1 2 3 4 5 6 7
         0 R N B Q K B N R
         1 P P P P P P P P
         2 . . . . . . . .
         3 . . . . . . . .
         4 . . . . p . . .
         5 . . . . . . . .
         6 p p p p . p p p
         7 r n b q k b n r
         */
        game.movePiece(fromCol: 4, fromRow: 6, toCol: 4, toRow: 4)
        
        /*
         + 0 1 2 3 4 5 6 7
         0 R N B Q K B N R
         1 P P P P . P P P
         2 . . . . P . . .
         3 . . . . . . . .
         4 . . . . p . . .
         5 . . . . . . . .
         6 p p p p . p p p
         7 r n b q k b n r
         */
        game.movePiece(fromCol: 4, fromRow: 1, toCol: 4, toRow: 2)
        
        /*
         + 0 1 2 3 4 5 6 7
         0 R N B Q K B N R
         1 P P P P . P P P
         2 . . . . P . . .
         3 . . . . . . . .
         4 . . . . p . . .
         5 . . . . . . . .
         6 p p p p k p p p
         7 r n b q . b n r
         */
        game.movePiece(fromCol: 4, fromRow: 7, toCol: 4, toRow: 6)
        
        /*
         + 0 1 2 3 4 5 6 7
         0 R N B . K B N R
         1 P P P P . P P P
         2 . . . . P . . .
         3 . . . . . . Q .
         4 . . . . p . . .
         5 . . . . . . . .
         6 p p p p k p p p
         7 r n b q . b n r
         */
        game.movePiece(fromCol: 3, fromRow: 0, toCol: 6, toRow: 3)
        
        /*
         + 0 1 2 3 4 5 6 7
         0 R N B . K B N R
         1 P P P P . P P P
         2 . . . . P . . .
         3 . . . . . . Q .
         4 . . . . p . . .
         5 . . . . . . . .
         6 p p p p . p p p
         7 r n b q k b n r
         */
        game.movePiece(fromCol: 4, fromRow: 6, toCol: 4, toRow: 7)
        
        /*
         + 0 1 2 3 4 5 6 7
         0 R N B . K . N R
         1 P P P P . P P P
         2 . . . . P . . .
         3 . . B . . . Q .
         4 . . . . p . . .
         5 . . . . . . . .
         6 p p p p . p p p
         7 r n b q k b n r
         */
        game.movePiece(fromCol: 5, fromRow: 0, toCol: 2, toRow: 3)
        
        /*
         + 0 1 2 3 4 5 6 7
         0 R N B . K . N R
         1 P P P P . P P P
         2 . . . . P . . .
         3 . . B . . . Q .
         4 . . . . p . . .
         5 . . . . . . . .
         6 p p p p k p p p
         7 r n b q . b n r
         */
        game.movePiece(fromCol: 4, fromRow: 7, toCol: 4, toRow: 6)
        
        /*
         + 0 1 2 3 4 5 6 7
         0 R N B . K . N R
         1 P P P P . P P P
         2 . . . . P . . .
         3 . . . . . . Q .
         4 . . . . p . . .
         5 . . . . B . . .
         6 p p p p k p p p
         7 r n b q . b n r
         */
        game.movePiece(fromCol: 2, fromRow: 3, toCol: 4, toRow: 5)
        XCTAssertTrue(game.whitesTurn)
        XCTAssertTrue(game.underThreatAt(col: 4, row: 5, whiteEnemy: false))
        XCTAssertFalse(game.canKingMove(fromCol: 4, fromRow: 6, toCol: 4, toRow: 5))
    }
    
    func testProtectorMovingAway() {
        var game = ChessEngine()
        game.initializeGame()
        
        /*
         + 0 1 2 3 4 5 6 7
         0 R N B Q K B N R
         1 P P P P P P P P
         2 . . . . . . . .
         3 . . . . . . . .
         4 . . . . p . . .
         5 . . . . . . . .
         6 p p p p . p p p
         7 r n b q k b n r
         */
        game.movePiece(fromCol: 4, fromRow: 6, toCol: 4, toRow: 4)
        
        /*
         + 0 1 2 3 4 5 6 7
         0 R N B Q K B N R
         1 P P P P . P P P
         2 . . . . P . . .
         3 . . . . . . . .
         4 . . . . p . . .
         5 . . . . . . . .
         6 p p p p . p p p
         7 r n b q k b n r
         */
        game.movePiece(fromCol: 4, fromRow: 1, toCol: 4, toRow: 2)
        
        /*
         + 0 1 2 3 4 5 6 7
         0 R N B Q K B N R
         1 P P P P . P P P
         2 . . . . P . . .
         3 . . . . . . . .
         4 . . . . p . . .
         5 . . . . . . . .
         6 p p p p k p p p
         7 r n b q . b n r
         */
        game.movePiece(fromCol: 4, fromRow: 7, toCol: 4, toRow: 6)
        
        /*
         + 0 1 2 3 4 5 6 7
         0 R N B . K B N R
         1 P P P P . P P P
         2 . . . . P . . .
         3 . . . . . . Q .
         4 . . . . p . . .
         5 . . . . . . . .
         6 p p p p k p p p
         7 r n b q . b n r
         */
        game.movePiece(fromCol: 3, fromRow: 0, toCol: 6, toRow: 3)
        
        /*
         + 0 1 2 3 4 5 6 7
         0 R N B . K B N R
         1 P P P P . P P P
         2 . . . . P . . .
         3 . . . . . . Q .
         4 . . . . p . . .
         5 . . . . . . . .
         6 p p p p . p p p
         7 r n b q k b n r
         */
        game.movePiece(fromCol: 4, fromRow: 6, toCol: 4, toRow: 7)
        
        /*
         + 0 1 2 3 4 5 6 7
         0 R N B . K . N R
         1 P P P P . P P P
         2 . . . . P . . .
         3 . . B . . . Q .
         4 . . . . p . . .
         5 . . . . . . . .
         6 p p p p . p p p
         7 r n b q k b n r
         */
        game.movePiece(fromCol: 5, fromRow: 0, toCol: 2, toRow: 3)
        
        /*
         + 0 1 2 3 4 5 6 7
         0 R N B . K . N R
         1 P P P P . P P P
         2 . . . . P . . .
         3 . . B . . . Q .
         4 . . . . p . . .
         5 . . . . . . . .
         6 p p p p k p p p
         7 r n b q . b n r
         */
        game.movePiece(fromCol: 4, fromRow: 7, toCol: 4, toRow: 6)
        
        /*
         + 0 1 2 3 4 5 6 7
         0 R N B . K . N R
         1 P P P P . P P P
         2 . . . . P . . .
         3 . . . . . . Q .
         4 . . . . p . . .
         5 . . . . B . . .
         6 p p p p k p p p
         7 r n b q . b n r
         */
        game.movePiece(fromCol: 2, fromRow: 3, toCol: 4, toRow: 5)
        XCTAssertTrue(game.whitesTurn)
        XCTAssertTrue(game.underThreatAt(col: 4, row: 5, whiteEnemy: false))
        XCTAssertFalse(game.canKingMove(fromCol: 4, fromRow: 6, toCol: 4, toRow: 5))
        XCTAssertFalse(game.isValid(fromCol: 4, fromRow: 6, toCol: 4, toRow: 5, isWhite: true))
        
        /*
         + 0 1 2 3 4 5 6 7
         0 R N B . K . N R
         1 P P P P . P P P
         2 . . . . P . . .
         3 . . . . . . Q .
         4 . . . . p . . .
         5 . . . . B p . .  <=
         6 p p p p k . p p  <=
         7 r n b q . b n r
         */
        game.movePiece(fromCol: 5, fromRow: 6, toCol: 5, toRow: 5)
        
        /*
         + 0 1 2 3 4 5 6 7
         0 R N B . K . N R
         1 P P P P . P P P
         2 . . . . P . . .
         3 . . . . . . . .
         4 . . . . p . Q .
         5 . . . . B p . .
         6 p p p p k . p p
         7 r n b q . b n r
         */
        game.movePiece(fromCol: 6, fromRow: 3, toCol: 6, toRow: 4)
        XCTAssertFalse(game.isValid(fromCol: 5, fromRow: 5, toCol: 5, toRow: 4, isWhite: true))
    }
    
    func testKingChecked() {
        var game = ChessEngine()
        game.initializeGame()
        
        /*
         + 0 1 2 3 4 5 6 7
         0 R N B Q K B N R
         1 P P P P P P P P
         2 . . . . . . . .
         3 . . . . . . . .
         4 . . . . . p . .
         5 . . . . . . . .
         6 p p p p p . p p
         7 r n b q k b n r
         */
        game.movePiece(fromCol: 5, fromRow: 6, toCol: 5, toRow: 4)
        
        /*
         + 0 1 2 3 4 5 6 7
         0 R N B Q K B N R
         1 P P P P . P P P
         2 . . . . P . . .
         3 . . . . . . . .
         4 . . . . . p . .
         5 . . . . . . . .
         6 p p p p p . p p
         7 r n b q k b n r
         */
        game.movePiece(fromCol: 4, fromRow: 1, toCol: 4, toRow: 2)
        
        /*
         + 0 1 2 3 4 5 6 7
         0 R N B Q K B N R
         1 P P P P . P P P
         2 . . . . P . . .
         3 . . . . . . . .
         4 . . . . . p . .
         5 . . . . . n . .
         6 p p p p p . p p
         7 r n b q k b . r
         */
        game.movePiece(fromCol: 6, fromRow: 7, toCol: 5, toRow: 5)
        
        /*
         + 0 1 2 3 4 5 6 7
         0 R N B . K B N R
         1 P P P P . P P P
         2 . . . . P . . .
         3 . . . . . . . .
         4 . . . . . p . Q
         5 . . . . . n . .
         6 p p p p p . p p
         7 r n b q k b . r
         */
        game.movePiece(fromCol: 3, fromRow: 0, toCol: 7, toRow: 4)
        XCTAssertTrue(game.checked(isWhite: true))
        XCTAssertFalse(game.checked(isWhite: false))
        XCTAssertTrue(game.canRescueCheck(move: ChessMove(fromCol: 6, fromRow: 6, toCol: 6, toRow: 5), isWhite: true))
        XCTAssertTrue(game.isValid(fromCol: 6, fromRow: 6, toCol: 6, toRow: 5, isWhite: true))
        XCTAssertFalse(game.isValid(fromCol: 7, fromRow: 6, toCol: 7, toRow: 5, isWhite: true))
        XCTAssertTrue(game.isValid(fromCol: 5, fromRow: 5, toCol: 7, toRow: 4, isWhite: true))
        
        /*
         + 0 1 2 3 4 5 6 7
         0 R N B . K B N R
         1 P P P P . P P P
         2 . . . . P . . .
         3 . . . . . . . .
         4 . . . . . p . Q
         5 . . . . . n p .
         6 p p p p p . . p
         7 r n b q k b . r
         */
        game.movePiece(fromCol: 6, fromRow: 6, toCol: 6, toRow: 5)
        
        /*
         + 0 1 2 3 4 5 6 7
         0 R N B . K B N R
         1 . P P P . P P P
         2 P . . . P . . .
         3 . . . . . . . .
         4 . . . . . p . Q
         5 . . . . . n p .
         6 p p p p p . . p
         7 r n b q k b . r
         */
        game.movePiece(fromCol: 0, fromRow: 1, toCol: 1, toRow: 2)
        
        /*
         + 0 1 2 3 4 5 6 7
         0 R N B . K B N R
         1 . P P P . P P P
         2 P . . . P . . .
         3 . . . . . . . .
         4 . . . . . p . Q
         5 . . . . . n p .
         6 p p p p p k . p
         7 r n b q . b . r
         */
        game.movePiece(fromCol: 4, fromRow: 7, toCol: 5, toRow: 6)
        
        /*
         + 0 1 2 3 4 5 6 7
         0 R N B . K B N R
         1 . P P P . P P P
         2 P . . . P . . .
         3 . . . . . . . .
         4 . . . . . p . .
         5 . . . . . n Q .
         6 p p p p p k . p
         7 r n b q . b . r
         */
        game.movePiece(fromCol: 7, fromRow: 4, toCol: 6, toRow: 5)
        XCTAssertTrue(game.checked(isWhite: true))
        XCTAssertTrue(game.canRescueCheck(move: ChessMove(fromCol: 5, fromRow: 6, toCol: 6, toRow: 5), isWhite: true))
    }
}
