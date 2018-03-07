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
    
    func testCanRookMove(){
        /*
         8 . . . . . . . .
         7 . . . . . . . .
         6 . . . . . . . .
         5 . . . . . . . .
         4 . . . . . . . .
         3 . . . . . . . .
         2 . . . . . . . .
         1 f . . K . . . t
         + A B C D E F G H
         */
        
        
//        let board = Board(numRows: 8, numCols: 8)
        
       
        
//        XCTAssertTrue(board.canRookMove(from: Point(row: 1, col: 1), to: Point(row: 2, col: 2)))
        
        
    }
    
    func testBoard(){
        
        /*
         8 . . . . . . . .
         7 . . . . . . . .
         6 . . . . . . . .
         5 . . . . . . . .
         4 . . . . . . . .
         3 . . . . . . . .
         2 . . . t . . f .
         1 . . . . . . . .
         + A B C D E F G H
         */
        
        let board = Board()
        
        print("\(board)")
    }
   
    // Pawn: if abs(from.row - to.row) == >=8 || abs(from.row - to.row) == <1
    
    /*
     8 . . . . . . . .
     7 . . . . . . . .
     6 . f . . P . t .
     5 . . . . . . . .
     4 . . . . . . . .
     3 . . . . . . . .
     2 . . . . . . . .
     1 . . . . . . . .
     + A B C D E F G H
     */
    // Rook: if going right (from.col < to.col) and there is a piece in the way && the to.col > than the from.col of the piece in the way || if going up (from.row < to.row) and there is a piece in the way && the to.col > than the from.col of the piece in the way || if going down (from.row > to.row) and there is a piece in the way && the to.row is < than the from.row of the piece in the way || if going left (from.col > to.col)and there is a piece the way && to.col is =< than the from.col of the piece in the way, return false. If abs(from.row - to.row) == >=8 || if abs(from.row - to.row) == <1 || if abs(from.col - to.col) == >=8 || abs(from.col - to.col) == <1, return false
    
    // Knight: if abs(from.row - to.row) == >=8 || abs(from.row - to.row) == <1 || if abs(from.col - to.col) == >=8 || abs(from.col - to.col) == <1
    
    //King: if abs(from.row - to.row) == >=8 || abs(from.row - to.row) == <1 || if abs(from.col - to.col) == >=8 || abs(from.col - to.col) == <1
    
    //Bishop: if going down left (from.col > to.col && from.row > to.row) and the piece's from.col and from.row is > than the to.col and to.row of the bishop || if going down right (from.col < to.col && from.row > to.row) and the piece's from.col < to.col of bishop || if going up left (from.row < to.row && from.col > to.col) and the piece's from.col > to.col of bishop || if going up right (from.col < to.col && from.row < to.row) and the piece's from.col and from.row< to.col and to.row of bishop || if abs(from.row - to.row) == >=8 || abs(from.row - to.row) == <1 || if abs(from.col - to.col) == >=8 || abs(from.col - to.col) == <1, return false.
    
    //Queen: if going down left (from.col > to.col && from.row > to.row) and the piece's from.col and from.row is > than the to.col and to.row of the bishop || if going down right (from.col < to.col && from.row > to.row) and the piece's from.col < to.col of bishop || if going up left (from.row < to.row && from.col > to.col) and the piece's from.col > to.col of bishop || if going up right (from.col < to.col && from.row < to.row) and the piece's from.col and from.row< to.col and to.row of bishop || if going right (from.col < to.col) and there is a piece in the way && the to.col > than the from.col of the piece in the way || if going up (from.row < to.row) and there is a piece in the way && the to.row > than the from.row of the piece in the way || if going down (from.row > to.row) and there is a piece in the way && the to.row is < than the from.row of the piece in the way || if going left (from.col > to.col)and there is a piece the way && to.col is =< than the from.col of the piece in the way, return false. If abs(from.row - to.row) == >=8 || if abs(from.row - to.row) == <1 || if abs(from.col - to.col) == >=8 || abs(from.col - to.col) == <1, return false
}
