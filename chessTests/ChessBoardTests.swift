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
    func testPrintBoard() {
        var board: ChessBoard = ChessBoard()
        board.pieces.insert(ChessPiece(rank: .pawn, col: 2, row: 7, isWhite: true, imgName: ""))
        board.pieces.insert(ChessPiece(rank: .rook, col: 5, row: 4, isWhite: false, imgName: ""))
        print(board)
    }
}
