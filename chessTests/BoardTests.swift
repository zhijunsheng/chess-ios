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
    
    
    
    func testBoardPieces() {
        var anything = Board()
        anything.pieces = [Piece(row: 1, col: 1, imageName: "<#String#>", isWhite: false, rank: .pawn),
                           Piece(row: 0, col: 0, imageName: "<#String#>", isWhite: false, rank: .rook),
                           Piece(row: 7, col: 2, imageName: "<#String#>", isWhite: true, rank: .bishop),
                           Piece(row: 0, col: 4, imageName: "<#String#>", isWhite: false, rank: .queen),
                           Piece(row: 1, col: 7, imageName: "<#String#>", isWhite: false, rank: .pawn),
                           Piece(row: 6, col: 5, imageName: "<#String#>", isWhite: true, rank: .pawn),
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
            Piece(row: 0, col: 0, imageName: "<#String#>", isWhite: false, rank: .rook),
            Piece(row: 0, col: 1, imageName: "<#String#>", isWhite: false, rank: .knight),
            Piece(row: 0, col: 2, imageName: "<#String#>", isWhite: false, rank: .bishop),
            Piece(row: 0, col: 3, imageName: "<#String#>", isWhite: false, rank: .queen),
            Piece(row: 0, col: 4, imageName: "<#String#>", isWhite: false, rank: .king),
            Piece(row: 0, col: 5, imageName: "<#String#>", isWhite: false, rank: .bishop),
            Piece(row: 0, col: 6, imageName: "<#String#>", isWhite: false, rank: .knight),
            Piece(row: 0, col: 7, imageName: "<#String#>", isWhite: false, rank: .rook),
            Piece(row: 7, col: 0, imageName: "<#String#>", isWhite: true, rank: .rook),
            Piece(row: 7, col: 1, imageName: "<#String#>", isWhite: true, rank: .knight),
            Piece(row: 7, col: 2, imageName: "<#String#>", isWhite: true, rank: .bishop),
            Piece(row: 7, col: 3, imageName: "<#String#>", isWhite: true, rank: .queen),
            Piece(row: 7, col: 4, imageName: "<#String#>", isWhite: true, rank: .king),
            Piece(row: 7, col: 5, imageName: "<#String#>", isWhite: true, rank: .bishop),
            Piece(row: 7, col: 6, imageName: "<#String#>", isWhite: true, rank: .knight),
            Piece(row: 7, col: 7, imageName: "<#String#>", isWhite: true, rank: .rook),
        ]
        
        for bpawnNo in 0...7 {
            board.pieces.insert(Piece(row: 1, col: bpawnNo, imageName: "<#String#>", isWhite: false, rank: .pawn))
        }
        for wpawnNo in 0...7 {
            board.pieces.insert(Piece(row: 6, col: wpawnNo, imageName: "<#String#>", isWhite: true, rank: .pawn))
        }
        XCTAssertEqual(32, board.pieces.count)
        print(board)
    }
    
    func testR() {
        // gdghf
    }
    
    func testNmove() {
        var board = Board()
        
        // only knight itself
        
        board.pieces = [Piece(row: 0, col: 1, imageName: "bn", isWhite: false, rank: .knight)]
        XCTAssertFalse(board.canKnightMoveFrom(fromRow: 0, fromCol: 1, toRow: 7, toCol: 7))
        XCTAssertTrue(board.canKnightMoveFrom(fromRow: 0, fromCol: 1, toRow: 2, toCol: 2))
        XCTAssertTrue(board.canKnightMoveFrom(fromRow: 0, fromCol: 1, toRow: 1, toCol: 3))
    }
}
