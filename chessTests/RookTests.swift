//
//  RookTests.swift
//  chessTests
//
//  Created by Peter Shi on 2020-07-05.
//  Copyright © 2020 GoldThumb Inc. All rights reserved.
//

import XCTest
@testable import chess

class RookTests: XCTestCase {

    func testR0() {
        var board = Board()
        board.pieces = [Piece(col: 7, row: 0, imageName: "br", isWhite: false, rank: .rook)]
        XCTAssertFalse(board.canRookMove(fromCol: 7, fromRow: 0, toCol: 6, toRow: 1))
        XCTAssertTrue(board.canRookMove(fromCol: 7, fromRow: 0, toCol: 7, toRow: 7))
    }
    
    /*
     
       0 1 2 3 4 5 6 7
     0 . . . . . . .|r|
     1 . . . . . . .|.|
     2 . . . . . . .|n|
     3 . . . . . . .|.|
     4 . . . . . . .|.|
     5 . . . . . . .|.|
     6 . . . . . . .|.|
     7 . . . . . . .|✗|
     
     */
    func testR1() {
        var board = Board()
        board.pieces = [Piece(col: 7, row: 0, imageName: "br", isWhite: false, rank: .rook),
                        Piece(col: 7, row: 2, imageName: "bn", isWhite: false, rank: .knight)]
        XCTAssertFalse(board.canRookMove(fromCol: 7, fromRow: 0, toCol: 6, toRow: 1))
        XCTAssertFalse(board.canRookMove(fromCol: 7, fromRow: 0, toCol: 7, toRow: 7))
        XCTAssertTrue(board.canRookMove(fromCol: 7, fromRow: 0, toCol: 7, toRow: 1))
    }
    
    func testR2() {
        /*
         
           0 1 2 3 4 5 6 7
         0 . . . . . . .|r|
         1 . . . . . . .|.|
         2 . . . . . . .|N|
         3 . . . . . . .|.|
         4 . . . . . . .|n|
         5 . . . . . . .|.|
         6 . . . . . . .|.|
         7 . . . . . . .|✗|
         
         */
        var board = Board()
        board.pieces = [Piece(col: 7, row: 0, imageName: "br", isWhite: false, rank: .rook),
                        Piece(col: 7, row: 2, imageName: "wn", isWhite: true, rank: .knight),
                        Piece(col: 7, row: 4, imageName: "bn", isWhite: false, rank: .knight)]
        XCTAssertFalse(board.canRookMove(fromCol: 7, fromRow: 0, toCol: 6, toRow: 1))
        XCTAssertTrue(board.canRookMove(fromCol: 7, fromRow: 0, toCol: 7, toRow: 2))
        XCTAssertFalse(board.canRookMove(fromCol: 7, fromRow: 0, toCol: 7, toRow: 7))
    }

}
