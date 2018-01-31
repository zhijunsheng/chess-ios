//
//  BoardTests.swift
//  chessTests
//
//  Created by Bowen Lin on 2018-01-30.
//  Copyright © 2018 GoldThumb Inc. All rights reserved.
//

import XCTest
@testable import chess

class BoardTests: XCTestCase {
    func testBoard(){
     
        func testSimpleBoardDescription(){
        
        }
        
        print("---------------------")
        let board = Board(numRows: 5, numCols: 3)
        
        print("\(board)")
    }
}
