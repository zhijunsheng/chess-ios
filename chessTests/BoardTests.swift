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
        let anything = Board()
        print(anything)
    }
    
    func testBoardPieces() {
        var anything = Board()
        anything.pieces = [Piece(row: 1, col: 1, isWhite: false, rank: .pawn),
                           Piece(row: 0, col: 0, isWhite: false, rank: .rook),
                           Piece(row: 7, col: 2, isWhite: true, rank: .bishop),
                           Piece(row: 0, col: 4, isWhite: false, rank: .queen),
                           Piece(row: 1, col: 7, isWhite: false, rank: .pawn),
                           Piece(row: 6, col: 5, isWhite: true, rank: .pawn),
        ]
        print(anything)
    }
    
    func testInitialBoard() {
        var board = Board()
        board.pieces = [
            Piece(row: 0, col: 0, isWhite: false, rank: .rook),
            Piece(row: 0, col: 1, isWhite: false, rank: .knight),
            Piece(row: 0, col: 2, isWhite: false, rank: .bishop),
            Piece(row: 0, col: 3, isWhite: false, rank: .king),
            Piece(row: 0, col: 4, isWhite: false, rank: .queen),
            Piece(row: 0, col: 5, isWhite: false, rank: .bishop),
            Piece(row: 0, col: 6, isWhite: false, rank: .knight),
            Piece(row: 0, col: 7, isWhite: false, rank: .rook),
            Piece(row: 7, col: 0, isWhite: false, rank: .rook),
            Piece(row: 7, col: 1, isWhite: false, rank: .knight),
            Piece(row: 7, col: 2, isWhite: false, rank: .bishop),
            Piece(row: 7, col: 3, isWhite: false, rank: .king),
            Piece(row: 7, col: 4, isWhite: false, rank: .queen),
            Piece(row: 7, col: 5, isWhite: false, rank: .bishop),
            Piece(row: 7, col: 6, isWhite: false, rank: .knight),
            Piece(row: 7, col: 7, isWhite: false, rank: .rook),
            Piece(row: 0, col: 0, isWhite: false, rank: .rook),
        ]
        
        XCTAssertEqual(32, board.pieces.count)
    }
}
