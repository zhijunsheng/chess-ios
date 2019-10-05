//
//  BoardTests.swift
//  chessTests
//
//  Created by Peter Shi on 2018-10-30.
//  Copyright © 2018 GoldThumb Inc. All rights reserved.
//

import XCTest
@testable import chess

class BoardTests: XCTestCase {
    
    func testPrintBoard() {
        let board = Board()
        print(board)
    }
    
    func testPiecesBetween() {
        /*
        0 1 2 3 4 5 6 7
        0 p . . . . . . .
        1 . . . . . . . .
        2 . . . . . . . .
        3 . . . . . . . .
        4 . . . . . . . .
        5 . . . . . . . .
        6 . . . . . . . .
        7 r . . . . . . .
        */
        var anything = Board()
        anything.pieces = [Piece(col: 0, row: 0, imageName: "wr", isWhite: false, rank: .pawn),
                           Piece(col: 0, row: 7, imageName: "wr", isWhite: false, rank: .rook),
        ]
        XCTAssertEqual(anything.numPiecesInBetween(fromRow: 0, fromCol: 0, toRow: 7, toCol: 0), 0)
        
        print(anything)
        
        /*
         0 1 2 3 4 5 6 7
         0 p . . . . . . .
         1 . . . . . . . .
         2 . . . . . . . .
         3 . . . . . . . .
         4 . . . . . . . .
         5 . . . . . . . .
         6 . . . . . . . .
         7 r . . . . . . .
         */
        
        var board = Board()
        
        board.pieces = [Piece(col: 0, row: 0, imageName: "wr", isWhite: false, rank: .pawn),
                        Piece(col: 0, row: 4, imageName: "wr", isWhite: false, rank: .bishop),
                        Piece(col: 0, row: 7, imageName: "wr", isWhite: false, rank: .rook),
        ]
        
        XCTAssertEqual(board.numPiecesInBetween(fromRow: 0, fromCol: 0, toRow: 7, toCol: 0), 1)
    }
    
    func testBoardPieces() {
        var anything = Board()
        anything.pieces = [Piece(col: 1, row: 1, imageName: "<#String#>", isWhite: false, rank: .pawn),
                           Piece(col: 0, row: 0, imageName: "<#String#>", isWhite: false, rank: .rook),
                           Piece(col: 2, row: 7, imageName: "<#String#>", isWhite: true, rank: .bishop),
                           Piece(col: 4, row: 0, imageName: "<#String#>", isWhite: false, rank: .queen),
                           Piece(col: 7, row: 1, imageName: "<#String#>", isWhite: false, rank: .pawn),
                           Piece(col: 5, row: 6, imageName: "<#String#>", isWhite: true, rank: .pawn),
        ]
        print(anything)
    }
    
    // FIXME: Swift
    
    /*
    r n b q k b n r
    p p p p p p p p
    . . . . . . . .
    . . . . . . . .
    . . . . . . . .
    . . . . . . . .
    P P P P P P P P
    R N B Q K B N R
    */
    func testInitialBoard() {
        var board = Board()
        
        board.pieces = [
            Piece(col: 0, row: 0, imageName: "<#String#>", isWhite: false, rank: .rook),
            Piece(col: 1, row: 0, imageName: "<#String#>", isWhite: false, rank: .knight),
            Piece(col: 2, row: 0, imageName: "<#String#>", isWhite: false, rank: .bishop),
            Piece(col: 3, row: 0, imageName: "<#String#>", isWhite: false, rank: .queen),
            Piece(col: 4, row: 0, imageName: "<#String#>", isWhite: false, rank: .king),
            Piece(col: 5, row: 0, imageName: "<#String#>", isWhite: false, rank: .bishop),
            Piece(col: 6, row: 0, imageName: "<#String#>", isWhite: false, rank: .knight),
            Piece(col: 7, row: 0, imageName: "<#String#>", isWhite: false, rank: .rook),
            Piece(col: 0, row: 7, imageName: "<#String#>", isWhite: true, rank: .rook),
            Piece(col: 1, row: 7, imageName: "<#String#>", isWhite: true, rank: .knight),
            Piece(col: 2, row: 7, imageName: "<#String#>", isWhite: true, rank: .bishop),
            Piece(col: 3, row: 7, imageName: "<#String#>", isWhite: true, rank: .queen),
            Piece(col: 4, row: 7, imageName: "<#String#>", isWhite: true, rank: .king),
            Piece(col: 5, row: 7, imageName: "<#String#>", isWhite: true, rank: .bishop),
            Piece(col: 6, row: 7, imageName: "<#String#>", isWhite: true, rank: .knight),
            Piece(col: 7, row: 7, imageName: "<#String#>", isWhite: true, rank: .rook),
        ]
        
        for bpawnNo in 0...7 {
            board.pieces.insert(Piece(col: bpawnNo, row: 1, imageName: "<#String#>", isWhite: false, rank: .pawn))
        }
        for wpawnNo in 0...7 {
            board.pieces.insert(Piece(col: wpawnNo, row: 6, imageName: "<#String#>", isWhite: true, rank: .pawn))
        }
        XCTAssertEqual(32, board.pieces.count)
        print(board)
    }
    
    /*
 
       0 1 2 3 4 5 6 7
     0 . . . . . . .|r|
     1 . . . . . . .|.|
     2 . . . . . . .|.|
     3 . . . . . . .|.|
     4 . . . . . . .|.|
     5 . . . . . . .|.|
     6 . . . . . . .|.|
     7 . . . . . . .|✗|
 
    */
    func testR0() {
        var board = Board()
        board.pieces = [Piece(col: 7, row: 0, imageName: "br", isWhite: false, rank: .rook)]
        XCTAssertFalse(board.canRookMoveFrom(fromRow: 0, fromCol: 7, toRow: 1, toCol: 6))
        XCTAssertTrue(board.canRookMoveFrom(fromRow: 0, fromCol: 7, toRow: 7, toCol: 7))
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
        XCTAssertFalse(board.canRookMoveFrom(fromRow: 0, fromCol: 7, toRow: 1, toCol: 6))
        XCTAssertFalse(board.canRookMoveFrom(fromRow: 0, fromCol: 7, toRow: 7, toCol: 7))
        XCTAssertTrue(board.canRookMoveFrom(fromRow: 0, fromCol: 7, toRow: 1, toCol: 7))
    }
    
    func testNmove() {
        var board = Board()
        
        // only knight itself
        
        board.pieces = [Piece(col: 1, row: 0, imageName: "bn", isWhite: false, rank: .knight)]
        XCTAssertFalse(board.canKnightMoveFrom(fromRow: 0, fromCol: 1, toRow: 7, toCol: 7))
        XCTAssertTrue(board.canKnightMoveFrom(fromRow: 0, fromCol: 1, toRow: 2, toCol: 2))
        XCTAssertTrue(board.canKnightMoveFrom(fromRow: 0, fromCol: 1, toRow: 1, toCol: 3))
    }
    
    // HW: test numPiecesInBetween
}
