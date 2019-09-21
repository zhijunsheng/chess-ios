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
        let board: ChessBoard = ChessBoard()
        print(board)
    }
}
