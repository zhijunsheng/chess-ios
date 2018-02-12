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
        
        /*
         5 . . .
         4 . . .
         3 . . .
         2 . . .
         1 . . .
         */
        
        let board = Board(numRows: 2, numCols: 5)
        
        print("\(board)")
    }
}
