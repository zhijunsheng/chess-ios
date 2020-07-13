//
//  KnightTests.swift
//  ChessTests
//
//  Created by Zhijun Sheng on 2020-07-05.
//  Copyright © 2020 Gold Thumb Inc. All rights reserved.
//

import XCTest
@testable import GT_Chess

class KnightTests: XCTestCase {
    /*
     
     0 1 2 3 4 5 6 7
     0 . . . . . . . .
     1 . . . . . . . .
     2 . . . . . . . .
     3 . . . . . . . .
     4 . . . . . . . .
     5 . x . . . . . .
     6 . . . . . . . .
     7 . n . . . . . .
     
     */
    func testKnightRules() {
        var game = Chess()
        game.pieces.insert(ChessPiece(col: 1, row: 7, imageName: "", isWhite: true, rank: .knight))
        XCTAssertFalse(game.isValid(fromCol: 1, fromRow: 7, toCol: 1, toRow: 5, isWhite: true))
    }
}
