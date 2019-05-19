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
    
    //TO DO:
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
            Piece(row: 0, col: 0, isWhite: false, rank: .rook),
            Piece(row: 0, col: 1, isWhite: false, rank: .knight),
            Piece(row: 0, col: 2, isWhite: false, rank: .bishop),
            Piece(row: 0, col: 3, isWhite: false, rank: .queen),
            Piece(row: 0, col: 4, isWhite: false, rank: .king),
            Piece(row: 0, col: 5, isWhite: false, rank: .bishop),
            Piece(row: 0, col: 6, isWhite: false, rank: .knight),
            Piece(row: 0, col: 7, isWhite: false, rank: .rook),
            Piece(row: 7, col: 0, isWhite: true, rank: .rook),
            Piece(row: 7, col: 1, isWhite: true, rank: .knight),
            Piece(row: 7, col: 2, isWhite: true, rank: .bishop),
            Piece(row: 7, col: 3, isWhite: true, rank: .queen),
            Piece(row: 7, col: 4, isWhite: true, rank: .king),
            Piece(row: 7, col: 5, isWhite: true, rank: .bishop),
            Piece(row: 7, col: 6, isWhite: true, rank: .knight),
            Piece(row: 7, col: 7, isWhite: true, rank: .rook),
        ]
        
        for bpawnNo in 0...7 {
            board.pieces += [Piece(row: 1, col: bpawnNo, isWhite: false, rank: .pawn)
            ]
        }
        for wpawnNo in 0...7 {
            board.pieces += [Piece(row: 6, col: wpawnNo, isWhite: true, rank: .pawn)
            ]
        }
        XCTAssertEqual(32, board.pieces.count)
        print(board)
    }
    
    func testNmove() {
        var board = Board()
        
        // only knight itself
        
        board.pieces = [Piece(row: 0, col: 1, isWhite: false, rank: .knight)]
        XCTAssertFalse(board.move(piece: board.pieces[0], destinationRow: 7, destinationCol: 7))
        
        board.pieces = [Piece(row: 0, col: 1, isWhite: false, rank: .knight)]
        XCTAssertTrue(board.move(piece: board.pieces[0], destinationRow: 2, destinationCol: 2))
        
        board.pieces = [Piece(row: 0, col: 1, isWhite: false, rank: .knight)]
        XCTAssertFalse(board.move(piece: board.pieces[0], destinationRow: -1, destinationCol: -1))
        print(board)
        board.pieces = [Piece(row: 0, col: 1, isWhite: false, rank: .knight)]
        XCTAssertTrue(board.move(piece: board.pieces[0], destinationRow: 1, destinationCol: 3))
        print(board)
        // ...
        board.pieces = [
            Piece(row: 0, col: 1, isWhite: false, rank: .knight),
            Piece(row: 1, col: 3, isWhite: false, rank: .pawn),
        ]
        XCTAssertFalse(board.move(piece: board.pieces[0], destinationRow: 1, destinationCol: 3))
        
        board.pieces = [
            Piece(row: 0, col: 1, isWhite: false, rank: .knight),
            Piece(row: 1, col: 3, isWhite: true, rank: .pawn),
        ]
        print(board)
        XCTAssertEqual(2, board.pieces.count)
        XCTAssertTrue(board.move(piece: board.pieces[0], destinationRow: 1, destinationCol: 3))
        print(board)
        XCTAssertEqual(1, board.pieces.count)
        board.pieces = [
            Piece(row: 0, col: 1, isWhite: false, rank: .knight),
            Piece(row: 1, col: 3, isWhite: true, rank: .pawn),
        ]
        print(board)
        XCTAssertFalse(board.move(piece: board.pieces[0], destinationRow: 0, destinationCol: 1))
        print(board)
        
        //pawn
        board.pieces = [
            Piece(row: 1, col: 4, isWhite: false, rank: .pawn),
        ]
        print(board)
        XCTAssertTrue(board.move(piece: board.pieces[0], destinationRow: 2, destinationCol: 4))
        print(board)
        board.pieces = [
            Piece(row: 1, col: 4, isWhite: false, rank: .pawn),
        ]
        print(board)
        XCTAssertFalse(board.move(piece: board.pieces[0], destinationRow: 0, destinationCol: 4))
        print(board)
        
    }
    
    func testRook() {
        var board = Board()
//        r . . . . . . .
//        . . . . . . . .
//        . . . . . . . .
//        . . . . . . . .
//        . . . . . . . .
//        . . . . . . . .
//        . . . . . . . .
//        . . . . . . . .

        //rook
        
        board.pieces = [
            Piece(row: 0, col: 0, isWhite: false, rank: .rook),
        ]
        print(board)
        XCTAssertTrue(board.move(piece: board.pieces[0], destinationRow: 0, destinationCol: 7))
        print(board)
        
        board.pieces = [
            Piece(row: 0, col: 0, isWhite: false, rank: .rook),
        ]
        print(board)
        XCTAssertFalse(board.move(piece: board.pieces[0], destinationRow: 3, destinationCol: 5))
        print(board)
        
        board.pieces = [
            Piece(row: 0, col: 0, isWhite: false, rank: .rook),
        ]
        print(board)
        XCTAssertFalse(board.move(piece: board.pieces[0], destinationRow: 0, destinationCol: 0))
        print(board)
    }
    
    func testBishop() {
        var board = Board()
        
        board.pieces = [
            Piece(row: 0, col: 0, isWhite: false, rank: .bishop),
        ]
        print(board)
        XCTAssertTrue(board.move(piece: board.pieces[0], destinationRow: 7, destinationCol: 7))
        print(board)
        
        board.pieces = [
            Piece(row: 0, col: 0, isWhite: false, rank: .bishop),
        ]
        print(board)
        XCTAssertFalse(board.move(piece: board.pieces[0], destinationRow: 3, destinationCol: 5))
        print(board)
    }
}
