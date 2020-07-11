//
//  BishopTests.swift
//  chessTests
//
//  Created by Peter Shi on 2020-07-05.
//  Copyright © 2020 GoldThumb Inc. All rights reserved.
//

import XCTest
@testable import chess

class BishopTests: XCTestCase {
    
    
    func testB() {
        var board = Board()
        XCTAssertTrue(board.canBishopMove(fromCol: 2, fromRow: 0, toCol: 0, toRow: 2))
        
        /*
         + 0 1 2 3 4 5 6 7
         0 . . o . . . . .
         1 . n . . . . . .
         2 O . . . . . . .
         3 . . . . . . . .
         4 . . . . . . . .
         5 . . . . . . . .
         6 . . . . . . . .
         7 . . . . . . . .
         */
        board.pieces = [Piece(col: 1, row: 1, imageName: "bn", isWhite: false, rank: .knight)]
        XCTAssertFalse(board.canBishopMove(fromCol: 2, fromRow: 0, toCol: 0, toRow: 2))
        
        /*
         + 0 1 2 3 4 5 6 7
         0 . . o . . . . .
         1 . . . . . . . .
         2 . . . . . . . .
         3 . . . . . . . .
         4 . . . . . . . .
         5 . . . . . . . o
         6 . . . . . . . .
         7 . . . . . . . .
         */
        board.pieces = [
        ]
        XCTAssertTrue(board.canBishopMove(fromCol: 7, fromRow: 5, toCol: 2, toRow: 0))
        
        /*
         0 1 2 3 4 5 6 7
         0 . . o . . . . .
         1 . . . . . . . .
         2 . . . . n . . .
         3 . . . . . . . .
         4 . . . . . . n .
         5 . . . . . . . o
         6 . . . . . . . .
         7 . . . . . . . .
         */
        board.pieces = [Piece(col: 4, row: 2, imageName: "bn", isWhite: false, rank: .knight),
                        Piece(col: 6, row: 4, imageName: "bn", isWhite: false, rank: .knight)
        ]
        XCTAssertFalse(board.canBishopMove(fromCol: 7, fromRow: 5, toCol: 2, toRow: 0))
        
        /*
         0 1 2 3 4 5 6 7
         0 . . . . . . O .
         1 . . . . . . . .
         2 . . . . . . . .
         3 . . . . . . . .
         4 . . . . . . . .
         5 . . . . . . . .
         6 O . . . . . . .
         7 . . . . . . . .
         */
        
        board.pieces = []
        
        XCTAssertTrue(board.canBishopMove(fromCol: 2, fromRow: 7, toCol: 6, toRow: 3))
        //        XCTAssertTrue(board.canBishopMove(fromCol: 1, fromRow: 7, toCol: 5, toRow: 3))
    }
    
    
}
