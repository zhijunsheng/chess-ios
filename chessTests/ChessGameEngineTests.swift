//
//  ChessGameEngineTests.swift
//  chessTests
//
//  Created by Elaine on 2019/10/27.
//  Copyright © 2019 GoldThumb Inc. All rights reserved.
//

import XCTest
@testable import chess

class ChessGameEngineTests: XCTestCase {
    func testPrintingChessBoard() {
        var engine = ChessGameEngine()
        print(engine)
        let queenW = ChessPiece(rank: "queen", isWhite: true, col: 4, row: 7, imageName:
            "queen_chess_w")
        engine.box.insert(queenW);        print(engine.box.count)
    }
}
