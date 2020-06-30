//
//  ChessEngineTests.swift
//  ChessTests
//
//  Created by Zhijun Sheng on 2020-06-30.
//  Copyright © 2020 Gold Thumb Inc. All rights reserved.
//

import XCTest
@testable import GT_Chess

class ChessEngineTests: XCTestCase {

    func testPrintingEmptyGameBoard() {
        var game = ChessEngine()
        game.initializeGame()
        print(game)
    }

}
