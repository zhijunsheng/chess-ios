//
//  PawnTests.swift
//  ChessTests
//
//  Created by Zhijun Sheng on 2020-07-05.
//  Copyright © 2020 Gold Thumb Inc. All rights reserved.
//

import XCTest
@testable import GT_Chess

class PawnTests: XCTestCase {
    
    func testPawnKilledWrongly() {
        var game = Chess()
        game.initializeGame()
        
        /*
         + 0 1 2 3 4 5 6 7
         0 R N B Q K B N R
         1 P P P P P P P P
         2 . . . . . . . .
         3 . . . . . . . .
         4 . p . . . . . .
         5 . . . . . . . .
         6 p . p p p p p p
         7 r n b q k b n r
         */
        game.movePiece(fromCol: 1, fromRow: 6, toCol: 1, toRow: 4)
        
        /*
         + 0 1 2 3 4 5 6 7
         0 R . B Q K B N R
         1 P P P P P P P P
         2 . . N . . . . .
         3 . . . . . . . .
         4 . p . . . . . .
         5 . . . . . . . .
         6 p . p p p p p p
         7 r n b q k b n r
         */
        game.movePiece(fromCol: 1, fromRow: 0, toCol: 2, toRow: 2)
        
        /*
         + 0 1 2 3 4 5 6 7
         0 R . B Q K B N R
         1 P P P P P P P P
         2 . . N . . . . .
         3 . p . . . . . .
         4 . . . . . . . .
         5 . . . . . . . .
         6 p . p p p p p p
         7 r n b q k b n r
         */
        game.movePiece(fromCol: 1, fromRow: 4, toCol: 1, toRow: 3)
        
        /*
         + 0 1 2 3 4 5 6 7
         0 R . B Q K B N R
         1 P P P P P P P .
         2 . . N . . . . P
         3 . p . . . . . .
         4 . . . . . . . .
         5 . . . . . . . .
         6 p . p p p p p p
         7 r n b q k b n r
         */
        game.movePiece(fromCol: 7, fromRow: 1, toCol: 7, toRow: 2)
        
        /*
         + 0 1 2 3 4 5 6 7
         0 R . B Q K B N R
         1 P P P P P P P .
         2 . . p . . . . P
         3 . . . . . . . .
         4 . . . . . . . .
         5 . . . . . . . .
         6 p . p p p p p p
         7 r n b q k b n r
         */
        game.movePiece(fromCol: 1, fromRow: 3, toCol: 2, toRow: 2)
        XCTAssertNotNil(game.pieceAt(col: 7, row: 2))
    }
    
    func testBlackPawnRules() {
        /*
         + 0 1 2 3 4 5 6 7
         0 . . . . . . . .
         1 . . . . . P . .
         2 . . . . . o x .
         3 . . . . . o . .
         4 . . . . . . . .
         5 . . . . . . . .
         6 p . . . . . . .
         7 . . . . . . . .
         */
        var game = Chess()
        game.pieces.insert(ChessPiece(col: 5, row: 1, imageName: "", isWhite: false, rank: .pawn))
        game.pieces.insert(ChessPiece(col: 0, row: 6, imageName: "", isWhite: true, rank: .pawn))
        game.movePiece(fromCol: 0, fromRow: 6, toCol: 0, toRow: 5)
        XCTAssertFalse(game.isValid(fromCol: 5, fromRow: 1, toCol: 6, toRow: 2, isWhite: false))
        XCTAssertTrue(game.isValid(fromCol: 5, fromRow: 1, toCol: 5, toRow: 2, isWhite: false))
        XCTAssertTrue(game.isValid(fromCol: 5, fromRow: 1, toCol: 5, toRow: 3, isWhite: false))
        
        /*
         + 0 1 2 3 4 5 6 7
         0 . . . . . . . .
         1 . . . . . P . .
         2 . . . . . n . .
         3 . . . . . x . .
         4 . . . . . . . .
         5 . . . . . . . .
         6 . . . . . . . .
         7 . . . . . . . .
         */
        game = Chess()
        game.pieces.insert(ChessPiece(col: 5, row: 1, imageName: "", isWhite: false, rank: .pawn))
        game.pieces.insert(ChessPiece(col: 5, row: 2, imageName: "", isWhite: true, rank: .knight))
        XCTAssertFalse(game.isValid(fromCol: 5, fromRow: 1, toCol: 5, toRow: 2, isWhite: false))
        XCTAssertFalse(game.isValid(fromCol: 5, fromRow: 1, toCol: 5, toRow: 3, isWhite: false))
        
        /*
         + 0 1 2 3 4 5 6 7
         0 . . . . . . . .
         1 . . . . . P . .
         2 . . . . . . . .
         3 . . . . . n . .
         4 . . . . . . . .
         5 . . . . . . . .
         6 . . . . . . . .
         7 . . . . . . . .
         */
        game = Chess()
        game.pieces.insert(ChessPiece(col: 5, row: 1, imageName: "", isWhite: false, rank: .pawn))
        game.pieces.insert(ChessPiece(col: 5, row: 3, imageName: "", isWhite: true, rank: .knight))
        XCTAssertTrue(game.isValid(fromCol: 5, fromRow: 1, toCol: 5, toRow: 2, isWhite: false))
        XCTAssertFalse(game.isValid(fromCol: 5, fromRow: 1, toCol: 5, toRow: 3, isWhite: false))
        
        /*
         + 0 1 2 3 4 5 6 7
         0 . . . . . . . .
         1 . . . . . . . .
         2 . . . . . . . .
         3 . . . . x x x .
         4 . . . . x P x .
         5 . . . . x o x .
         6 . . . . . . . .
         7 . . . . . . . .
         */
        game = Chess()
        game.pieces.insert(ChessPiece(col: 5, row: 4, imageName: "", isWhite: false, rank: .pawn))
        XCTAssertTrue(game.isValid(fromCol: 5, fromRow: 4, toCol: 5, toRow: 5, isWhite: false))
        XCTAssertFalse(game.isValid(fromCol: 5, fromRow: 4, toCol: 4, toRow: 3, isWhite: false))
        XCTAssertFalse(game.isValid(fromCol: 5, fromRow: 4, toCol: 4, toRow: 4, isWhite: false))
        XCTAssertFalse(game.isValid(fromCol: 5, fromRow: 4, toCol: 4, toRow: 5, isWhite: false))
        XCTAssertFalse(game.isValid(fromCol: 5, fromRow: 4, toCol: 5, toRow: 3, isWhite: false))
        XCTAssertFalse(game.isValid(fromCol: 5, fromRow: 4, toCol: 6, toRow: 5, isWhite: false))
        XCTAssertFalse(game.isValid(fromCol: 5, fromRow: 4, toCol: 6, toRow: 4, isWhite: false))
        XCTAssertFalse(game.isValid(fromCol: 5, fromRow: 4, toCol: 6, toRow: 3, isWhite: false))
        
        /*
         + 0 1 2 3 4 5 6 7
         0 . . . . . . . .
         1 . . . . . . . .
         2 . . . . . . . .
         3 . . . . . P . .
         4 . . . . . n . .
         5 . . . . . . . .
         6 . . . . . . . .
         7 . . . . . . . .
         */
        game = Chess()
        game.pieces.insert(ChessPiece(col: 5, row: 3, imageName: "", isWhite: false, rank: .pawn))
        game.pieces.insert(ChessPiece(col: 5, row: 4, imageName: "", isWhite: true, rank: .knight))
        XCTAssertFalse(game.isValid(fromCol: 5, fromRow: 3, toCol: 5, toRow: 4, isWhite: false))
        
        /*
         + 0 1 2 3 4 5 6 7
         0 . . . . . . . .
         1 . . . . . . . .
         2 . . . . . P . .
         3 . . . . n . n .
         4 . . . . . . . .
         5 . . . . . . . .
         6 . . . . . . . .
         7 . . . . . . . .
         */
        game = Chess()
        game.pieces.insert(ChessPiece(col: 5, row: 2, imageName: "", isWhite: false, rank: .pawn))
        game.pieces.insert(ChessPiece(col: 4, row: 3, imageName: "", isWhite: true, rank: .knight))
        game.pieces.insert(ChessPiece(col: 6, row: 3, imageName: "", isWhite: true, rank: .knight))
        XCTAssertTrue(game.isValid(fromCol: 5, fromRow: 2, toCol: 4, toRow: 3, isWhite: false))
        XCTAssertTrue(game.isValid(fromCol: 5, fromRow: 2, toCol: 6, toRow: 3, isWhite: false))
        
        /*
         + 0 1 2 3 4 5 6 7
         0 . . . . . . . .
         1 . . P . . . . .
         2 . . . p . . . .
         3 . . . . . . . .
         4 . . . . . . . .
         5 . . . . . . . .
         6 . . . . . . . .
         7 . . . . . . . .
         */
        game = Chess()
        game.pieces.insert(ChessPiece(col: 2, row: 1, imageName: "", isWhite: false, rank: .pawn))
        game.pieces.insert(ChessPiece(col: 3, row: 2, imageName: "", isWhite: true, rank: .pawn))
        XCTAssertTrue(game.isValid(fromCol: 2, fromRow: 1, toCol: 3, toRow: 2, isWhite: false))
    }
    
    func testWhiteEnPassant() {
        /*
         + 0 1 2 3 4 5 6 7
         0 . . . . . . . .
         1 . . . . . . . .
         2 . . . . o . . .
         3 . . . . P p . .
         4 . . . . . . . .
         5 . . . . . . . .
         6 . . . . . . . .
         7 . . . . . . . .
         */
        var game = Chess()
        game.pieces.insert(ChessPiece(col: 5, row: 3, imageName: "", isWhite: true, rank: .pawn))
        game.pieces.insert(ChessPiece(col: 4, row: 1, imageName: "", isWhite: false, rank: .pawn))
        game.movePiece(fromCol: 4, fromRow: 1, toCol: 4, toRow: 3)
        XCTAssertTrue(game.isValid(fromCol: 5, fromRow: 3, toCol: 4, toRow: 2, isWhite: true))
        
        XCTAssertNotNil(game.pieceAt(col: 4, row: 3))
        game.movePiece(fromCol: 5, fromRow: 3, toCol: 4, toRow: 2)
        XCTAssertNil(game.pieceAt(col: 4, row: 3))
        XCTAssertNotNil(game.pieceAt(col: 4, row: 2))
        
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
         
         + 0 1 2 3 4 5 6 7
         0 R . B Q K B N R
         1 P P P P P P P P
         2 N . . . . . . .
         3 . . . . . . . .
         4 . . . . . p . .
         5 . . . . . . . .
         6 p p p p p . p p
         7 r n b q k b n r
         
         + 0 1 2 3 4 5 6 7
         0 R . B Q K B N R
         1 P P P P P P P P
         2 N . . . . . . .
         3 . . . . . p . .
         4 . . . . . . . .
         5 . . . . . . . .
         6 p p p p p . p p
         7 r n b q k b n r
         
         */
        game = Chess()
        game.initializeGame()
        
        game.movePiece(fromCol: 5, fromRow: 6, toCol: 5, toRow: 4)
        game.movePiece(fromCol: 1, fromRow: 0, toCol: 0, toRow: 2)
        game.movePiece(fromCol: 5, fromRow: 4, toCol: 5, toRow: 3)
        
        XCTAssertNotNil(game.pieceAt(col: 0, row: 2))
        
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
         
         + 0 1 2 3 4 5 6 7
         0 R . B Q K B N R
         1 P P P P P P P P
         2 N . . . . . . .
         3 . . . . . . . .
         4 . . . . . p . .
         5 . . . . . . . .
         6 p p p p p . p p
         7 r n b q k b n r
         
         + 0 1 2 3 4 5 6 7
         0 R . B Q K B N R
         1 P P P P P P P P
         2 N . . . . . . .
         3 . . . . . p . .
         4 . . . . . . . .
         5 . . . . . . . .
         6 p p p p p . p p
         7 r n b q k b n r
         
         + 0 1 2 3 4 5 6 7
         0 R . B Q K B N R
         1 P P P P . P P P
         2 N . . . . . . .
         3 . . . . P p . .
         4 . . . . . . . .
         5 . . . . . . . .
         6 p p p p p . p p
         7 r n b q k b n r
         
         */
        game = Chess()
        game.initializeGame()
        
        game.movePiece(fromCol: 5, fromRow: 6, toCol: 5, toRow: 4)
        game.movePiece(fromCol: 1, fromRow: 0, toCol: 0, toRow: 2)
        game.movePiece(fromCol: 5, fromRow: 4, toCol: 5, toRow: 3)
        game.movePiece(fromCol: 4, fromRow: 1, toCol: 4, toRow: 3)
        
        XCTAssertNotNil(game.pieceAt(col: 0, row: 2))
        XCTAssertNotNil(game.pieceAt(col: 5, row: 3))
    }
    
    func testBlackEnPassant() {
        /*
         + 0 1 2 3 4 5 6 7
         0 . . . . . . . .
         1 . . . . . . . .
         2 . . . . . . . .
         3 . . . . . . . .
         4 . . . . . P p .
         5 . . . . . . o .
         6 . . . . . . . .
         7 . . . . . . . .
         */
        var game = Chess()
        game.pieces.insert(ChessPiece(col: 5, row: 4, imageName: "", isWhite: false, rank: .pawn))
        game.pieces.insert(ChessPiece(col: 6, row: 6, imageName: "", isWhite: true, rank: .pawn))
        game.movePiece(fromCol: 6, fromRow: 6, toCol: 6, toRow: 4)
        XCTAssertTrue(game.isValid(fromCol: 5, fromRow: 4, toCol: 6, toRow: 5, isWhite: false))
        
        XCTAssertNotNil(game.pieceAt(col: 6, row: 4))
        game.movePiece(fromCol: 5, fromRow: 4, toCol: 6, toRow: 5)
        XCTAssertNil(game.pieceAt(col: 6, row: 4))
        XCTAssertNotNil(game.pieceAt(col: 6, row: 5))
    }
    
    func testWhitePawnRules() {
        /*
         + 0 1 2 3 4 5 6 7
         0 . . . . . . . .
         1 . . . . . . . .
         2 . . . . . . . .
         3 . . . . . . . .
         4 . . . . . o . .
         5 . . . . x o x .
         6 . . . . x p x .
         7 . . . . . . . .
         */
        var game = Chess()
        game.pieces.insert(ChessPiece(col: 5, row: 6, imageName: "", isWhite: true, rank: .pawn))
        XCTAssertFalse(game.isValid(fromCol: 5, fromRow: 6, toCol: 6, toRow: 5, isWhite: true))
        XCTAssertTrue(game.isValid(fromCol: 5, fromRow: 6, toCol: 5, toRow: 5, isWhite: true))
        XCTAssertTrue(game.isValid(fromCol: 5, fromRow: 6, toCol: 5, toRow: 4, isWhite: true))
        
        /*
         + 0 1 2 3 4 5 6 7
         0 . . . . . . . .
         1 . . . . . . . .
         2 . . . . . . . .
         3 . . . . . . . .
         4 . . . . . x . .
         5 . . . . . N . .
         6 . . . . . p . .
         7 . . . . . . . .
         */
        game = Chess()
        game.pieces.insert(ChessPiece(col: 5, row: 6, imageName: "", isWhite: true, rank: .pawn))
        game.pieces.insert(ChessPiece(col: 5, row: 5, imageName: "", isWhite: false, rank: .knight))
        XCTAssertFalse(game.isValid(fromCol: 5, fromRow: 6, toCol: 5, toRow: 5, isWhite: true))
        XCTAssertFalse(game.isValid(fromCol: 5, fromRow: 6, toCol: 5, toRow: 4, isWhite: true))
        
        /*
         + 0 1 2 3 4 5 6 7
         0 . . . . . . . .
         1 . . . . . . . .
         2 . . . . . . . .
         3 . . . . . . . .
         4 . . . . . N . .
         5 . . . . . . . .
         6 . . . . . p . .
         7 . . . . . . . .
         */
        game = Chess()
        game.pieces.insert(ChessPiece(col: 5, row: 6, imageName: "", isWhite: true, rank: .pawn))
        game.pieces.insert(ChessPiece(col: 5, row: 4, imageName: "", isWhite: false, rank: .knight))
        XCTAssertTrue(game.isValid(fromCol: 5, fromRow: 6, toCol: 5, toRow: 5, isWhite: true))
        XCTAssertFalse(game.isValid(fromCol: 5, fromRow: 6, toCol: 5, toRow: 4, isWhite: true))
        
        /*
         + 0 1 2 3 4 5 6 7
         0 . . . . . . . .
         1 . . . . . . . .
         2 . . . . . . . .
         3 . . . . x o x .
         4 . . . . x p x .
         5 . . . . x x x .
         6 . . . . . . . .
         7 . . . . . . . .
         */
        game = Chess()
        game.pieces.insert(ChessPiece(col: 5, row: 4, imageName: "", isWhite: true, rank: .pawn))
        XCTAssertTrue(game.isValid(fromCol: 5, fromRow: 4, toCol: 5, toRow: 3, isWhite: true))
        XCTAssertFalse(game.isValid(fromCol: 5, fromRow: 4, toCol: 4, toRow: 3, isWhite: true))
        XCTAssertFalse(game.isValid(fromCol: 5, fromRow: 4, toCol: 4, toRow: 4, isWhite: true))
        XCTAssertFalse(game.isValid(fromCol: 5, fromRow: 4, toCol: 4, toRow: 5, isWhite: true))
        XCTAssertFalse(game.isValid(fromCol: 5, fromRow: 4, toCol: 5, toRow: 5, isWhite: true))
        XCTAssertFalse(game.isValid(fromCol: 5, fromRow: 4, toCol: 6, toRow: 5, isWhite: true))
        XCTAssertFalse(game.isValid(fromCol: 5, fromRow: 4, toCol: 6, toRow: 4, isWhite: true))
        XCTAssertFalse(game.isValid(fromCol: 5, fromRow: 4, toCol: 6, toRow: 3, isWhite: true))
        
        /*
         + 0 1 2 3 4 5 6 7
         0 . . . . . . . .
         1 . . . . . . . .
         2 . . . . . . . .
         3 . . . . . N . .
         4 . . . . . p . .
         5 . . . . . . . .
         6 . . . . . . . .
         7 . . . . . . . .
         */
        game = Chess()
        game.pieces.insert(ChessPiece(col: 5, row: 4, imageName: "", isWhite: true, rank: .pawn))
        game.pieces.insert(ChessPiece(col: 5, row: 3, imageName: "", isWhite: false, rank: .knight))
        XCTAssertFalse(game.isValid(fromCol: 5, fromRow: 4, toCol: 5, toRow: 3, isWhite: true))
        
        /*
         + 0 1 2 3 4 5 6 7
         0 . . . . . . . .
         1 . . . . . . . .
         2 . . . . . x . .
         3 . . . . . . . .
         4 . . . . . p . .
         5 . . . . . . . .
         6 . . . . . . . .
         7 . . . . . . . .
         */
        game = Chess()
        game.pieces.insert(ChessPiece(col: 5, row: 4, imageName: "", isWhite: true, rank: .pawn))
        XCTAssertFalse(game.isValid(fromCol: 5, fromRow: 4, toCol: 5, toRow: 2, isWhite: true))
        
        /*
         + 0 1 2 3 4 5 6 7
         0 . . . . . . . .
         1 . . . . . . . .
         2 . . . . . . . .
         3 . . . . N . N .
         4 . . . . . p . .
         5 . . . . . . . .
         6 . . . . . . . .
         7 . . . . . . . .
         */
        game = Chess()
        game.pieces.insert(ChessPiece(col: 5, row: 4, imageName: "", isWhite: true, rank: .pawn))
        game.pieces.insert(ChessPiece(col: 4, row: 3, imageName: "", isWhite: false, rank: .knight))
        game.pieces.insert(ChessPiece(col: 6, row: 3, imageName: "", isWhite: false, rank: .knight))
        XCTAssertTrue(game.isValid(fromCol: 5, fromRow: 4, toCol: 4, toRow: 3, isWhite: true))
        XCTAssertTrue(game.isValid(fromCol: 5, fromRow: 4, toCol: 6, toRow: 3, isWhite: true))
    }
    
    func testCanPawnAttach() {
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
        var game = Chess()
        game.initializeGame()
        XCTAssertTrue(game.canPawnAttack(Move(0, 6, 1, 5)))
        XCTAssertFalse(game.canPawnAttack(Move(0, 6, 0, 5)))
        XCTAssertTrue(game.canPawnAttack(Move(7, 1, 6, 2)))
        XCTAssertFalse(game.canPawnAttack(Move(7, 1, 7, 2)))
    }
    
    func testKnightPromotionForbidden() {
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
        var game = Chess()
        game.initializeGame()
        game.movePiece(fromCol: 6, fromRow: 7, toCol: 7, toRow: 5)
        game.movePiece(fromCol: 0, fromRow: 1, toCol: 0, toRow: 2)
        game.movePiece(fromCol: 7, fromRow: 5, toCol: 6, toRow: 3)
        game.movePiece(fromCol: 0, fromRow: 2, toCol: 0, toRow: 3)
        game.movePiece(fromCol: 6, fromRow: 3, toCol: 7, toRow: 1)
        game.movePiece(fromCol: 0, fromRow: 3, toCol: 0, toRow: 4)
        game.movePiece(fromCol: 7, fromRow: 1, toCol: 5, toRow: 0)
        XCTAssertFalse(game.needsPromotion())
    }
    
    func testPromotion() {
        var game = Chess()
        game.initializeGame()
        
        /*
         + 0 1 2 3 4 5 6 7
         0 R N B Q K B N R
         1 P P P P P P P P
         2 . . . . . . . .
         3 . . . . . . . .
         4 . . . . . . . p
         5 . . . . . . . .
         6 p p p p p p p .
         7 r n b q k b n r
         */
        game.movePiece(fromCol: 7, fromRow: 6, toCol: 7, toRow: 4)
        
        /*
         + 0 1 2 3 4 5 6 7
         0 R N B Q K B N R
         1 . P P P P P P P
         2 P . . . . . . .
         3 . . . . . . . .
         4 . . . . . . . p
         5 . . . . . . . .
         6 p p p p p p p .
         7 r n b q k b n r
         */
        game.movePiece(fromCol: 0, fromRow: 1, toCol: 0, toRow: 2)
        
        /*
         + 0 1 2 3 4 5 6 7
         0 R N B Q K B N R
         1 . P P P P P P P
         2 P . . . . . . .
         3 . . . . . . . p
         4 . . . . . . . .
         5 . . . . . . . .
         6 p p p p p p p .
         7 r n b q k b n r
         */
        game.movePiece(fromCol: 7, fromRow: 4, toCol: 7, toRow: 3)
        
        /*
         + 0 1 2 3 4 5 6 7
         0 R N B Q K B N R
         1 . P P P P P P P
         2 . . . . . . . .
         3 P . . . . . . p
         4 . . . . . . . .
         5 . . . . . . . .
         6 p p p p p p p .
         7 r n b q k b n r
         */
        game.movePiece(fromCol: 0, fromRow: 2, toCol: 0, toRow: 3)
        
        /*
         + 0 1 2 3 4 5 6 7
         0 R N B Q K B N R
         1 . P P P P P P P
         2 . . . . . . . p
         3 P . . . . . . .
         4 . . . . . . . .
         5 . . . . . . . .
         6 p p p p p p p .
         7 r n b q k b n r
         */
        game.movePiece(fromCol: 7, fromRow: 3, toCol: 7, toRow: 2)
        
        /*
         + 0 1 2 3 4 5 6 7
         0 R N B Q K B N R
         1 . P P P P P P P
         2 . . . . . . . p
         3 . . . . . . . .
         4 P . . . . . . .
         5 . . . . . . . .
         6 p p p p p p p .
         7 r n b q k b n r
         */
        game.movePiece(fromCol: 0, fromRow: 3, toCol: 0, toRow: 4)
        
        /*
         + 0 1 2 3 4 5 6 7
         0 R N B Q K B N R
         1 . P P P P P p P
         2 . . . . . . . .
         3 . . . . . . . .
         4 P . . . . . . .
         5 . . . . . . . .
         6 p p p p p p p .
         7 r n b q k b n r
         */
        game.movePiece(fromCol: 7, fromRow: 2, toCol: 6, toRow: 1)
        
        /*
         + 0 1 2 3 4 5 6 7
         0 R N B Q K B N R
         1 . P P P P P p P
         2 . . . . . . . .
         3 . . . . . . . .
         4 . . . . . . . .
         5 P . . . . . . .
         6 p p p p p p p .
         7 r n b q k b n r
         */
        game.movePiece(fromCol: 0, fromRow: 4, toCol: 0, toRow: 5)
        
        /*
         + 0 1 2 3 4 5 6 7
         0 R N B Q K B N p
         1 . P P P P P . P
         2 . . . . . . . .
         3 . . . . . . . .
         4 . . . . . . . .
         5 P . . . . . . .
         6 p p p p p p p .
         7 r n b q k b n r
         */
        game.movePiece(fromCol: 6, fromRow: 1, toCol: 7, toRow: 0)
        XCTAssertTrue(game.needsPromotion())
        XCTAssertEqual(game.pieceAt(col: 7, row: 0)?.rank, .pawn)
    }
    
    func testAlreadyPromoted() {
        var game = Chess()
        game.initializeGame()
        
        /*
         + 0 1 2 3 4 5 6 7
         0 R N B Q K B N R
         1 P P P P P P P P
         2 . . . . . . . .
         3 . . . . . . . .
         4 . . . . . . . p
         5 . . . . . . . .
         6 p p p p p p p .
         7 r n b q k b n r
         */
        game.movePiece(fromCol: 7, fromRow: 6, toCol: 7, toRow: 4)
        
        /*
         + 0 1 2 3 4 5 6 7
         0 R N B Q K B N R
         1 . P P P P P P P
         2 P . . . . . . .
         3 . . . . . . . .
         4 . . . . . . . p
         5 . . . . . . . .
         6 p p p p p p p .
         7 r n b q k b n r
         */
        game.movePiece(fromCol: 0, fromRow: 1, toCol: 0, toRow: 2)
        
        /*
         + 0 1 2 3 4 5 6 7
         0 R N B Q K B N R
         1 . P P P P P P P
         2 P . . . . . . .
         3 . . . . . . . p
         4 . . . . . . . .
         5 . . . . . . . .
         6 p p p p p p p .
         7 r n b q k b n r
         */
        game.movePiece(fromCol: 7, fromRow: 4, toCol: 7, toRow: 3)
        
        /*
         + 0 1 2 3 4 5 6 7
         0 R N B Q K B N R
         1 . P P P P P P P
         2 . . . . . . . .
         3 P . . . . . . p
         4 . . . . . . . .
         5 . . . . . . . .
         6 p p p p p p p .
         7 r n b q k b n r
         */
        game.movePiece(fromCol: 0, fromRow: 2, toCol: 0, toRow: 3)
        
        /*
         + 0 1 2 3 4 5 6 7
         0 R N B Q K B N R
         1 . P P P P P P P
         2 . . . . . . . p
         3 P . . . . . . .
         4 . . . . . . . .
         5 . . . . . . . .
         6 p p p p p p p .
         7 r n b q k b n r
         */
        game.movePiece(fromCol: 7, fromRow: 3, toCol: 7, toRow: 2)
        
        /*
         + 0 1 2 3 4 5 6 7
         0 R N B Q K B N R
         1 . P P P P P P P
         2 . . . . . . . p
         3 . . . . . . . .
         4 P . . . . . . .
         5 . . . . . . . .
         6 p p p p p p p .
         7 r n b q k b n r
         */
        game.movePiece(fromCol: 0, fromRow: 3, toCol: 0, toRow: 4)
        
        /*
         + 0 1 2 3 4 5 6 7
         0 R N B Q K B N R
         1 . P P P P P p P
         2 . . . . . . . .
         3 . . . . . . . .
         4 P . . . . . . .
         5 . . . . . . . .
         6 p p p p p p p .
         7 r n b q k b n r
         */
        game.movePiece(fromCol: 7, fromRow: 2, toCol: 6, toRow: 1)
        
        /*
         + 0 1 2 3 4 5 6 7
         0 R N B Q K B N R
         1 . P P P P P p P
         2 . . . . . . . .
         3 . . . . . . . .
         4 . . . . . . . .
         5 P . . . . . . .
         6 p p p p p p p .
         7 r n b q k b n r
         */
        game.movePiece(fromCol: 0, fromRow: 4, toCol: 0, toRow: 5)
        
        /*
         + 0 1 2 3 4 5 6 7
         0 R N B Q K B N p
         1 . P P P P P . P
         2 . . . . . . . .
         3 . . . . . . . .
         4 . . . . . . . .
         5 P . . . . . . .
         6 p p p p p p p .
         7 r n b q k b n r
         */
        game.movePiece(fromCol: 6, fromRow: 1, toCol: 7, toRow: 0)
        XCTAssertTrue(game.needsPromotion())
        XCTAssertEqual(game.pieceAt(col: 7, row: 0)?.rank, .pawn)
        
        game.promoteTo(rank: .knight)
        XCTAssertFalse(game.needsPromotion())
    }
}
