//
//  PawnTests.swift
//  chessTests
//
//  Created by Peter Shi on 2020-07-05.
//  Copyright © 2020 GoldThumb Inc. All rights reserved.
//

import XCTest
@testable import chess

class PawnTests: XCTestCase {

    
    /*
     
       0 1 2 3 4 5 6 7
     0 r n b q k b n r
     1 p p p p p p p p
     2 . . . . . . . .
     3 . . . . . . . .
     4 . . . . . . . .
     5 . . . P . . . .
     6 P P P P . P P P
     7 R N B Q K B N R
     
     */
    func testPawnMoveDiagonally() {
        var game = Board()
//        game.initPieces()
        print(game)
//        XCTAssertTrue(game.canPawnMove(fromCol: 4, fromRow: 6, toCol: 4, toRow: 5, isWhite: true))
//        XCTAssertTrue(game.canPawnMove(fromCol: 4, fromRow: 6, toCol: 4, toRow: 4, isWhite: true))
//        XCTAssertFalse(game.canPawnMove(fromCol: 4, fromRow: 6, toCol: 3, toRow: 5, isWhite: true))
//
        game.pieces = [Piece(col: 4, row: 6, imageName: "pawn_chess_w", isWhite: true, rank: .pawn),
                Piece(col: 3, row: 5, imageName: "pawn_chess_b", isWhite: false, rank: .pawn)]
        XCTAssertTrue(game.canPawnMove(fromCol: 4, fromRow: 6, toCol: 3, toRow: 5, isWhite: true))
        game.pieces = [Piece(col: 4, row: 6, imageName: "pawn_chess_w", isWhite: true, rank: .pawn),
        Piece(col: 3, row: 5, imageName: "pawn_chess_w", isWhite: true, rank: .pawn)]
        XCTAssertFalse(game.canPawnMove(fromCol: 4, fromRow: 6, toCol: 3, toRow: 5, isWhite: true))
    }

}
