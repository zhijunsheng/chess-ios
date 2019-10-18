//
//  ChessBoardTests.swift
//  chessTests
//
//  Created by Halwong on 2019/9/20.
//  Copyright © 2019 GoldThumb Inc. All rights reserved.
//

import XCTest

@testable import chess

class ChessBoardTests: XCTestCase {
    
    // promotion of pawn
    // castling of rook & king
    // knight, rook, king, queen, bishop, pawn
    /*
     
     
       0 1 2 3 4 5 6 7
     0 . . . . . . . .
     1 . . o . o . . .
     2 . o . . . o . .
     3 . . . n . . . .
     4 . o . . . o . .
     5 . . o . o . . .
     6 . . . . . . . .
     7 . . . . . . . .
     
     */
    func testCanKnightMove() {
        let board = ChessBoard()
        
        XCTAssertTrue(board.canKnightMove(fromCol: 3, fromRow: 3, toCol: 5, toRow: 4))
        XCTAssertTrue(board.canKnightMove(fromCol: 3, fromRow: 3, toCol: 4, toRow: 5))
        XCTAssertTrue(board.canKnightMove(fromCol: 3, fromRow: 3, toCol: 2, toRow: 5))
        XCTAssertTrue(board.canKnightMove(fromCol: 3, fromRow: 3, toCol: 1, toRow: 2))
        XCTAssertTrue(board.canKnightMove(fromCol: 3, fromRow: 3, toCol: 1, toRow: 4))
        XCTAssertTrue(board.canKnightMove(fromCol: 3, fromRow: 3, toCol: 2, toRow: 1))
        XCTAssertTrue(board.canKnightMove(fromCol: 3, fromRow: 3, toCol: 4, toRow: 1))
        
        XCTAssertTrue(board.canKnightMove(fromCol: 3, fromRow: 3, toCol: 1, toRow: 2))
    }
    
    
    
    
    
    /*
     
     castle
     castling
 
       0 1 2 3 4 5 6 7
     0 . . . . k . . r
     1 . . . . . . . .
     2 . . . . . . . .
     3 . . . . . . . .
     4 . . . . . . . .
     5 . . . . . . . .
     6 . . . . . . . .
     7 . . . . . . . .
     
     
       0 1 2 3 4 5 6 7
     0 . . . . . r k .
     1 . . . . . . . .
     2 . . . . . . . .
     3 . . . . . . . .
     4 . . . . . . . .
     5 . . . . . . . .
     6 . . . . . . . .
     7 . . . . . . . .
     
    */
    
    
    
    func testPrintBoard() {
        var board: ChessBoard = ChessBoard()
        board.pieces.insert(ChessPiece(rank: .pawn, col: 2, row: 7, isWhite: true, imgName: ""))
        board.pieces.insert(ChessPiece(rank: .rook, col: 5, row: 4, isWhite: false, imgName: ""))
        print(board)
    }
}
