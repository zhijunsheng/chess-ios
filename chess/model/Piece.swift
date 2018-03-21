//
//  Piece.swift
//  chess
//
//  Created by Bowen Lin on 2018-02-20.
//  Copyright © 2018 GoldThumb Inc. All rights reserved.
//

import Foundation

struct Piece {
    let color: Player
    let pieceType: PieceType
    let location: Point
   
    
    
   
    
    
    /*
     8 . . . . . . . .
     7 . . . . . . . .
     6 . . . . . . . .
     5 . . . . . . . .
     4 . . . . . . . .
     3 . . . * . . . .
     2 . . . P . . . .
     1 . . . . . . . .
     + A B C D E F G H
     */
    func canPawnMove(from:Point, to:Point) -> Bool {
        return from.col == to.col && from.row - to.row == -1
    }
    
    /*
     8 . . . . . . . .
     7 . . . . . . . .
     6 . . * * * . . .
     5 . . * K * . . .
     4 . . * * * . . .
     3 . . . . . . . .
     2 . . . . . . . .
     1 . . . . . . . .
     + A B C D E F G H
     */
    func canKingMove(from:Point, to:Point) -> Bool {
        return abs(from.col - to.col) == 1 && abs(from.row - to.row) == 1 ||
               from.col == to.col && abs(from.row - to.row) == 1 ||
               abs(from.col - to.col) == 1 && from.row == to.row
    }
    
    /*
     8 . . . * . . . *
     7 * . . * . . * .
     6 . * . * . * . .
     5 . . * * * . . .
     4 * * * Q * * * *
     3 . . * * * . . .
     2 . * . * . * . .
     1 * . . * . . * .
     + A B C D E F G H
     */
    func canQueenMove(from:Point, to:Point) -> Bool {
        return canBishopMove(from: from, to: to) || canRookMove(from: from, to: to)
    }
    
    /*
     8 . . . . . . . *
     7 * . . . . . * .
     6 . * . . . * . .
     5 . . * . * . . .
     4 . . . B . . . .
     3 . . * . * . . .
     2 . * . . . * . .
     1 * . . . . . * .
     + A B C D E F G H
     */
    func canBishopMove(from:Point, to:Point) -> Bool {
        return abs(from.col - to.col) == abs(from.row - to.row)
    }
    
    /*
     8 . . . * . . . .
     7 . . . * . . . .
     6 . . . * . . . .
     5 . . . * . . . .
     4 * * * R * * * *
     3 . . . * . . . .
     2 . . . * . . . .
     1 . . . * . . . .
     + A B C D E F G H
     */
    func canRookMove(from:Point, to:Point) -> Bool {
        return from.row == to.row || from.col == to.col
    }
    
    /*
     8 . . . . . . . .
     7 . . . . . . . .
     6 . . * . * . . .
     5 . * . . . * . .
     4 . . . K . . . .
     3 . * . . . * . .
     2 . . * . * . . .
     1 . . . . . . . .
     + A B C D E F G H
     */
    func canKnightMove(from: Point, to: Point) -> Bool {
        return abs(from.col - to.col) == 2 && abs(from.row - to.row) == 1 ||
               abs(from.col - to.col) == 1 && abs(from.row - to.row) == 2
    }
}
