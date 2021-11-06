//
//  GameLogicTests.swift
//  chessTests
//
//  Created by Harry Shen on 11/6/21.
//  Copyright © 2021 GoldThumb Inc. All rights reserved.
//

import XCTest
@testable import chess

class GameLogicTests: XCTestCase {

    func testPrintBoard() {
        var gameLogic = GameLogic()
        gameLogic.restart()
        print(gameLogic)
    }

}
