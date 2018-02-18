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
         8 . . . . . . . .
         7 . . . . . . . .
         6 . . . . . . . .
         5 . . . . . . . .
         4 . . . . . . . .
         3 . . . . . . . .
         2 . . . . . . . .
         1 . . . . . . . .
         + A B C D E F G H
         */
        
        let board = Board(numRows: 8, numCols: 8)
        
        print("\(board)")
    }
}
