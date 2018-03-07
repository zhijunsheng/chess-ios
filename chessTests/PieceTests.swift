//
//  PieceTests.swift
//  chessTests
//
//  Created by Bowen Lin on 2018-02-20.
//  Copyright © 2018 GoldThumb Inc. All rights reserved.
//

import XCTest

@testable import chess

class PieceTests: XCTestCase {
 
    func testCanKnightMove() {
        let knight = Piece(color: .white, pieceType: .knight)
        /*
         8 . . . . . . . .
         7 . . . . . . . .
         6 . . . . . . . .
         5 . . . . . . . .
         4 . . . . . . . .
         3 . . . . . . . .
         2 t . . . . . . .
         1 f . . . . . . .
         + A B C D E F G H
         */
        
        XCTAssertFalse(knight.canKnightMove(from: Point(row: 1, col: 1), to: Point(row: 2, col: 1)))
        /*
         8 . . . . . . . .
         7 . . . . . . . .
         6 . . . . . . . .
         5 . . . . . . . .
         4 . . . . . . . .
         3 . . . . . . . .
         2 . t . . . . . .
         1 f . . . . . . .
         + A B C D E F G H
         */
        
        XCTAssertFalse(knight.canKnightMove(from: Point(row: 1, col: 1), to: Point(row: 2, col: 2)))
        /*
         8 . . . . . . . .
         7 . . . . . . . .
         6 . . . . . . . .
         5 . . . . . . . .
         4 . . . . . . . .
         3 . t . . . . . .
         2 . . . . . . . .
         1 f . . . . . . .
         + A B C D E F G H
         */
       
        XCTAssertTrue(knight.canKnightMove(from: Point(row: 1, col: 1), to: Point(row: 3, col: 2)))
        /*
         8 . . . . . . . .
         7 . . . . . . . .
         6 . . . . . . . .
         5 . . . . . . . .
         4 . . . . . . . .
         3 . f . . . . . .
         2 . . . . . . . .
         1 t . . . . . . .
         + A B C D E F G H
         */
       
        XCTAssertTrue(knight.canKnightMove(from: Point(row: 3, col: 2), to: Point(row: 1, col: 1)))
        /*
         8 . . . . . . . .
         7 . . . . . . . .
         6 . . . . . . . .
         5 . . . . . . . .
         4 . . . t . . . .
         3 . f . . . . . .
         2 . . . . . . . .
         1 . . . . . . . .
         + A B C D E F G H
         */

    XCTAssertTrue(knight.canKnightMove(from: Point(row: 3, col: 2), to: Point(row: 4, col: 4)))
        /*
         8 . . . . . . . .
         7 . . . . . . . .
         6 . . . . . . . .
         5 . . . . . . . .
         4 . . . f . . . .
         3 . t . . . . . .
         2 . . . . . . . .
         1 . . . . . . . .
         + A B C D E F G H
         */
        
        XCTAssertTrue(knight.canKnightMove(from: Point(row: 4, col: 4), to: Point(row: 3, col: 2)))
        /*
         8 . . . . . . . .
         7 . . . . . . . .
         6 . . . . . . . .
         5 . . . . . . . .
         4 . . . . . . . .
         3 . f . . . . . .
         2 . . . . . . . .
         1 . . t . . . . .
         + A B C D E F G H
         */
        
        XCTAssertTrue(knight.canKnightMove(from: Point(row: 3, col: 2), to: Point(row: 1, col: 3)))
        /*
         8 . . . . . . . .
         7 . . . . . . . .
         6 . . . . . . . .
         5 . . . . . . . .
         4 . . . . . . . .
         3 . . . . . . . . t
         2 . . . . . . . .
         1 . . . . . . . f
         + A B C D E F G H
         */
       
        XCTAssertTrue(knight.canKnightMove(from: Point(row: 1, col: 8), to: Point(row: 3, col: 9)))
    
    }
    
    func testCanRookMove(){
        let rook = Piece(color: .black, pieceType: .rook)
        /*
         8 . . . . . . . .
         7 . . . . . . . .
         6 . . . . . . . .
         5 . . . . . . . .
         4 . . . . . . . .
         3 . . . . . . . .
         2 t . . . . . . .
         1 f . . . . . . .
         + A B C D E F G H
         */

        XCTAssertTrue(rook.canRookMove(from: Point(row: 1, col: 1), to: Point(row: 2, col: 1)))
        /*
         8 . . . . . . . .
         7 . . . . . . . .
         6 . . . . . . . .
         5 . . . . . . . .
         4 . . . . . . . .
         3 . . . . . . . .
         2 . t . . . . . .
         1 f . . . . . . .
         + A B C D E F G H
         */

        XCTAssertFalse(rook.canRookMove(from: Point(row: 1, col: 1), to: Point(row: 2, col: 2)))
        
        /*
         8 . . . . . . . .
         7 . . . . . . . .
         6 . . . . . . . .
         5 . . . . . . . .
         4 . . . . . . . .
         3 . . . . . . . .
         2 . . . . . . . .
         1 f . . . . . . t
         + A B C D E F G H
         */
        XCTAssertTrue(rook.canRookMove(from: Point(row: 1, col: 1), to: Point(row: 1, col: 8)))
        /*
         8 . . . . . . . .
         7 . . . f . . . .
         6 . . . . . . . .
         5 . . . . . . . .
         4 . . . . . . . .
         3 . . . t . . . .
         2 . . . . . . . .
         1 . . . . . . . .
         + A B C D E F G H
         */

        XCTAssertTrue(rook.canRookMove(from: Point(row: 7, col: 4), to: Point(row: 3, col: 4)))
    }

    func testCanBishopMove(){
        let bishop = Piece(color: .white, pieceType: .bishop)
        /*
         8 . . . . . . . .
         7 . . . . . . . .
         6 . . . . . . . .
         5 . . . . . . . .
         4 . . . . . . . .
         3 . . t . . . . .
         2 . . . . . . . .
         1 f . . . . . . .
         + A B C D E F G H
         */
        
        XCTAssertTrue(bishop.canBishopMove(from: Point(row: 1, col: 1), to: Point(row: 3, col: 3)))
        /*
         8 . . . . . . . .
         7 . . . . . . . .
         6 . . . . . . . .
         5 . . t . . . . .
         4 . . . . . . . .
         3 . . . . . . . .
         2 . . . . . . . .
         1 . . . . . . f .
         + A B C D E F G H
         */
        
        XCTAssertTrue(bishop.canBishopMove(from: Point(row: 1, col: 7), to: Point(row: 5, col: 3)))
        /*
         8 . . . . . . . .
         7 . . . . . . . .
         6 . . . . . . . .
         5 . f . . . . . .
         4 . . t . . . . .
         3 . . . . . . . .
         2 . . . . . . . .
         1 . . . . . . . .
         + A B C D E F G H
         */
        
        XCTAssertTrue(bishop.canBishopMove(from: Point(row: 5, col: 2), to: Point(row: 4, col: 3)))
        /*
         8 . . . . . . . f
         7 . . . . . . . .
         6 . . . . . . . .
         5 . . . . . . . .
         4 . . . . . . . .
         3 . . t . . . . .
         2 . . . . . . . .
         1 . . . . . . . .
         + A B C D E F G H
         */
        
        XCTAssertTrue(bishop.canBishopMove(from: Point(row: 8, col: 8), to: Point(row: 3, col: 3)))
        /*
         8 . . . . . . . .
         7 . . . . . . . .
         6 . . . . . . . .
         5 . . . . . . . .
         4 . . . . . . . .
         3 . . t f . . . .
         2 . . . . . . . .
         1 . . . . . . . .
         + A B C D E F G H
         */
        
        XCTAssertFalse(bishop.canBishopMove(from: Point(row: 3, col: 3), to: Point(row: 3, col: 4)))
    }
    
    func testQueenCanMove(){
        let queen = Piece(color: .white, pieceType: .queen)
        /*
         8 . . . . . . . .
         7 . . . . . . . .
         6 . . . . . . . .
         5 . . . . . . . .
         4 . . . . . . . .
         3 . . t f . . . .
         2 . . . . . . . .
         1 . . . . . . . .
         + A B C D E F G H
         */
        
        XCTAssertTrue(queen.canQueenMove(from: Point(row: 3, col: 3), to: Point(row: 3, col: 4)))
        /*
         8 . . . . . . . .
         7 . . . . . . . .
         6 . . . . . . . .
         5 . . . . . . . .
         4 . . . . . . . .
         3 . . . f . . t .
         2 . . . . . . . .
         1 . . . . . . . .
         + A B C D E F G H
         */
        
        XCTAssertTrue(queen.canQueenMove(from: Point(row: 3, col: 4), to: Point(row: 3, col: 7)))
        /*
         8 . . . . . . . .
         7 . t . . . . . .
         6 . . . . . . . .
         5 . . . . . . . .
         4 . . . . . . . .
         3 . f . . . . . .
         2 . . . . . . . .
         1 . . . . . . . .
         + A B C D E F G H
         */
        
        XCTAssertTrue(queen.canQueenMove(from: Point(row: 3, col: 3), to: Point(row: 3, col: 4)))
        /*
         8 . . . . . . . .
         7 . . . . . f . .
         6 . . . . . . . .
         5 . . . . . . . .
         4 . . . . . . . .
         3 . . . . . t . .
         2 . . . . . . . .
         1 . . . . . . . .
         + A B C D E F G H
         */
        
        XCTAssertTrue(queen.canQueenMove(from: Point(row: 7, col: 6), to: Point(row: 3, col: 6)))
        /*
         8 . . . . . . . .
         7 . f . . . . . .
         6 . . . . . . . .
         5 . . . . . . . .
         4 . . . . . . . .
         3 . . . . . t . .
         2 . . . . . . . .
         1 . . . . . . . .
         + A B C D E F G H
         */
        
        XCTAssertTrue(queen.canQueenMove(from: Point(row: 7, col: 2), to: Point(row: 2, col: 7)))
        /*
         8 . . . . . . . .
         7 . . . . . t . .
         6 . . . . f . . .
         5 . . . . . . . .
         4 . . . . . . . .
         3 . . . . . . . .
         2 . . . . . . . .
         1 . . . . . . . .
         + A B C D E F G H
         */
        
        XCTAssertTrue(queen.canQueenMove(from: Point(row: 6, col: 5), to: Point(row: 7, col: 6)))
        /*
         8 . . . . . . . .
         7 . . . . . f . .
         6 . . . . . . . .
         5 . . . . . . . .
         4 . . . . . . . .
         3 . . . . . t . .
         2 . . . . . . . .
         1 . . . . . . . .
         + A B C D E F G H
         */
        
        XCTAssertTrue(queen.canQueenMove(from: Point(row: 7, col: 6), to: Point(row: 3, col: 6)))
        /*
         8 . . . . . . . .
         7 . t . . . . . .
         6 . . . . . . . .
         5 . . . . . . . .
         4 . . . . . . . .
         3 . . . . . . . .
         2 . . . . . . f .
         1 . . . . . . . .
         + A B C D E F G H
         */
        
        XCTAssertTrue(queen.canQueenMove(from: Point(row: 2, col: 7), to: Point(row: 7, col: 2)))
        /*
         8 . . . t . . . .
         7 . . . . . . . .
         6 . . . . . . . .
         5 . . f . . . . .
         4 . . . . . . . .
         3 . . . . . . . .
         2 . . . . . . . .
         1 . . . . . . . .
         + A B C D E F G H
         */
        
        XCTAssertFalse(queen.canQueenMove(from: Point(row: 8, col: 4), to: Point(row: 5, col: 3)))
    }
    
    func testCanKingMove(){
         let king = Piece(color: .white, pieceType: .king)
        /*
         8 . . . . . . . .
         7 . . . . . . . .
         6 . . . . . . . .
         5 . . . . . . . .
         4 . . . . . . . .
         3 . . . . . . t .
         2 . . . . . . f .
         1 . . . . . . . .
         + A B C D E F G H
         */
        
        XCTAssertTrue(king.canKingMove(from: Point(row: 2, col: 7), to: Point(row: 3, col: 7)))
        /*
         8 . . . . . . . .
         7 . . . . . . . .
         6 . . . . . . . .
         5 . . . . . . . .
         4 . . . . . . . .
         3 . . t . . . . .
         2 . . . f . . . .
         1 . . . . . . . .
         + A B C D E F G H
         */
        
        XCTAssertTrue(king.canKingMove(from: Point(row: 2, col: 4), to: Point(row: 3, col: 3)))
        /*
         8 . . . . . . . .
         7 . . . t f . . .
         6 . . . . . . . .
         5 . . . . . . . .
         4 . . . . . . . .
         3 . . . . . . . .
         2 . . . . . . . .
         1 . . . . . . . .
         + A B C D E F G H
         */
        
        XCTAssertTrue(king.canKingMove(from: Point(row: 7, col: 5), to: Point(row: 7, col: 4)))
        /*
         8 . . . . . . . .
         7 . . . . . . . .
         6 . . . . . . . .
         5 . . . . . . . .
         4 . . . . . . . .
         3 . . . . . . . .
         2 . f . . . . . .
         1 t . . . . . . .
         + A B C D E F G H
         */
        
        XCTAssertTrue(king.canKingMove(from: Point(row: 2, col: 2), to: Point(row: 1, col: 1)))
        /*
         8 . . . . . . . .
         7 . . . . . . . .
         6 . . . . . . . .
         5 . . . . . . . .
         4 . . . f . . . .
         3 . . . t . . . .
         2 . . . . . . . .
         1 . . . . . . . .
         + A B C D E F G H
         */
        
        XCTAssertTrue(king.canKingMove(from: Point(row: 4, col: 4), to: Point(row: 3, col: 4)))
        /*
         8 . . . . . . . .
         7 . . . . . . . .
         6 . . . . f . . .
         5 . . . . . t . .
         4 . . . . . . . .
         3 . . . . . . . .
         2 . . . . . . . .
         1 . . . . . . . .
         + A B C D E F G H
         */
        
        XCTAssertTrue(king.canKingMove(from: Point(row: 6, col: 5), to: Point(row: 5, col: 6)))
        /*
         8 . . . . . . . .
         7 . . . . . . . .
         6 . . . . . . . .
         5 f t . . . . . .
         4 . . . . . . . .
         3 . . . . . . . .
         2 . . . . . . . .
         1 . . . . . . . .
         + A B C D E F G H
         */
        
        XCTAssertTrue(king.canKingMove(from: Point(row: 5, col: 1), to: Point(row: 5, col: 2)))
        /*
         8 . . . . . . . .
         7 . . . . . . . .
         6 . . . . . . . .
         5 . . . . . . f .
         4 . . . . . . . .
         3 . . . . . . t .
         2 . . . . . . . .
         1 . . . . . . . .
         + A B C D E F G H
         */
        
        XCTAssertFalse(king.canKingMove(from: Point(row: 5, col: 7), to: Point(row: 3, col: 7)))
    }
    
    func testCanPawnMove(){
        let pawn = Piece(color: .black, pieceType: .pawn)
        /*
         8 . . . . . . . .
         7 . . . . . . . .
         6 . . . . . . . .
         5 . . . . . . . .
         4 . . . . . . . .
         3 . . . t . . . .
         2 . . . f . . . .
         1 . . . . . . . .
         + A B C D E F G H
         */
        
        XCTAssertTrue(pawn.canPawnMove(from: Point(row: 2, col: 4), to: Point(row: 3, col: 4)))
        /*
         8 . . . . . t . .
         7 . . . . . f . .
         6 . . . . . . . .
         5 . . . . . . . .
         4 . . . . . . . .
         3 . . . . . . . .
         2 . . . . . . . .
         1 . . . . . . . .
         + A B C D E F G H
         */
        
        XCTAssertTrue(pawn.canPawnMove(from: Point(row: 7, col: 6), to: Point(row: 8, col: 6)))
        /*
         8 . . . . . . . .
         7 . . . . . . . .
         6 . f . . . . . .
         5 . t . . . . . .
         4 . . . . . . . .
         3 . . . . . . . .
         2 . . . . . . . .
         1 . . . . . . . .
         + A B C D E F G H
         */
        
        XCTAssertFalse(pawn.canPawnMove(from: Point(row: 6, col: 2), to: Point(row: 5, col: 2)))
    }
}
