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
    
    func canPawnMove(from:Point, to:Point) -> Bool{
        
      return false
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
    func canKingMove(from:Point, to:Point) -> Bool{
        var canMove = false
        if abs(from.col - to.col) == 1 && abs(from.row - to.row) == 1 {
            canMove = true
        } else if from.col == to.col && abs(from.row - to.row) == 1 {
            canMove = true
        } else if abs(from.col - to.col) == 1 && from.row == to.row {
           canMove =  true
        }
        return canMove
    }
    
    func canQueenMove(from:Point, to:Point) -> Bool{
        if from.col - to.col == 1 && from.row - to.row == 1{
            return true
        } else if from.col - to.col == 2 && from.row - to.row == 2{
            return true
        } else if from.col - to.col == 3 && from.row - to.row == 3{
            return true
        } else if from.col - to.col == 4 && from.row - to.row == 4{
            return true
        } else if from.col - to.col == 5 && from.row - to.row == 5{
            return true
        } else if from.col - to.col == 6 && from.row - to.row == 6{
            return true
        } else if from.col - to.col == 7 && from.row - to.row == 7{
            return true
        } else if from.col - to.col == -1 && from.row - to.row == -1{
            return true
        } else if from.col - to.col == -2 && from.row - to.row == -2{
            return true
        } else if from.col - to.col == -3 && from.row - to.row == -3{
            return true
        } else if from.col - to.col == -4 && from.row - to.row == -4{
            return true
        } else if from.col - to.col == -5 && from.row - to.row == -5{
            return true
        } else if from.col - to.col == -6 && from.row - to.row == -6{
            return true
        } else if from.col - to.col == -7 && from.row - to.row == -7{
            return true
        } else if from.col - to.col == 1 && from.row - to.row == -1{
            return true
        } else if from.col - to.col == 2 && from.row - to.row == -2{
            return true
        } else if from.col - to.col == 3 && from.row - to.row == -3{
            return true
        } else if from.col - to.col == 4 && from.row - to.row == -4{
            return true
        } else if from.col - to.col == 5 && from.row - to.row == -5{
            return true
        } else if from.col - to.col == 6 && from.row - to.row == -6{
            return true
        } else if from.col - to.col == 7 && from.row - to.row == -7{
            return true
        } else if from.col - to.col == -1 && from.row - to.row == 1{
            return true
        } else if from.col - to.col == -2 && from.row - to.row == 2{
            return true
        } else if from.col - to.col == -3 && from.row - to.row == 3{
            return true
        } else if from.col - to.col == -4 && from.row - to.row == 4{
            return true
        } else if from.col - to.col == -5 && from.row - to.row == 5{
            return true
        } else if from.col - to.col == -6 && from.row - to.row == 6{
            return true
        } else if from.col - to.col == -7 && from.row - to.row == 7{
            return true
        } else if from.col - to.col == 1 && from.row - to.row == 0{
            return true
        } else if from.col - to.col == 2 && from.row - to.row == 0{
            return true
        } else if from.col - to.col == 3 && from.row - to.row == 0{
            return true
        } else if from.col - to.col == 4 && from.row - to.row == 0{
            return true
        } else if from.col - to.col == 5 && from.row - to.row == 0{
            return true
        } else if from.col - to.col == 6 && from.row - to.row == 0{
            return true
        } else if from.col - to.col == 7 && from.row - to.row == 0{
            return true
        } else if from.col - to.col == 0 && from.row - to.row == 1{
            return true
        } else if from.col - to.col == 0 && from.row - to.row == 2{
            return true
        } else if from.col - to.col == 0 && from.row - to.row == 3{
            return true
        } else if from.col - to.col == 0 && from.row - to.row == 4{
            return true
        } else if from.col - to.col == 0 && from.row - to.row == 5{
            return true
        } else if from.col - to.col == 0 && from.row - to.row == 6{
            return true
        } else if from.col - to.col == 0 && from.row - to.row == 7{
            return true
        } else if from.col - to.col == -1 && from.row - to.row == 0{
            return true
        } else if from.col - to.col == -2 && from.row - to.row == 0{
            return true
        } else if from.col - to.col == -3 && from.row - to.row == 0{
            return true
        } else if from.col - to.col == -4 && from.row - to.row == 0{
            return true
        } else if from.col - to.col == -5 && from.row - to.row == 0{
            return true
        } else if from.col - to.col == -6 && from.row - to.row == 0{
            return true
        } else if from.col - to.col == -7 && from.row - to.row == 0{
            return true
        } else if from.col - to.col == 0 && from.row - to.row == -1{
            return true
        } else if from.col - to.col == 0 && from.row - to.row == -2{
            return true
        } else if from.col - to.col == 0 && from.row - to.row == -3{
            return true
        } else if from.col - to.col == 0 && from.row - to.row == -4{
            return true
        } else if from.col - to.col == 0 && from.row - to.row == -5{
            return true
        } else if from.col - to.col == 0 && from.row - to.row == -6{
            return true
        } else if from.col - to.col == 0 && from.row - to.row == -7{
            return true
        } else {
            return false
        }
    }
    
    func canBishopMove(from:Point, to:Point) -> Bool{
        
        if from.col - to.col == 1 && from.row - to.row == 1{
            return true
        } else if from.col - to.col == 2 && from.row - to.row == 2{
            return true
        } else if from.col - to.col == 3 && from.row - to.row == 3{
            return true
        } else if from.col - to.col == 4 && from.row - to.row == 4{
            return true
        } else if from.col - to.col == 5 && from.row - to.row == 5{
            return true
        } else if from.col - to.col == 6 && from.row - to.row == 6{
            return true
        } else if from.col - to.col == 7 && from.row - to.row == 7{
            return true
        } else if from.col - to.col == -1 && from.row - to.row == -1{
            return true
        } else if from.col - to.col == -2 && from.row - to.row == -2{
            return true
        } else if from.col - to.col == -3 && from.row - to.row == -3{
            return true
        } else if from.col - to.col == -4 && from.row - to.row == -4{
            return true
        } else if from.col - to.col == -5 && from.row - to.row == -5{
            return true
        } else if from.col - to.col == -6 && from.row - to.row == -6{
            return true
        } else if from.col - to.col == -7 && from.row - to.row == -7{
            return true
        } else if from.col - to.col == 1 && from.row - to.row == -1{
            return true
        } else if from.col - to.col == 2 && from.row - to.row == -2{
            return true
        } else if from.col - to.col == 3 && from.row - to.row == -3{
            return true
        } else if from.col - to.col == 4 && from.row - to.row == -4{
            return true
        } else if from.col - to.col == 5 && from.row - to.row == -5{
            return true
        } else if from.col - to.col == 6 && from.row - to.row == -6{
            return true
        } else if from.col - to.col == 7 && from.row - to.row == -7{
            return true
        } else if from.col - to.col == -1 && from.row - to.row == 1{
            return true
        } else if from.col - to.col == -2 && from.row - to.row == 2{
            return true
        } else if from.col - to.col == -3 && from.row - to.row == 3{
            return true
        } else if from.col - to.col == -4 && from.row - to.row == 4{
            return true
        } else if from.col - to.col == -5 && from.row - to.row == 5{
            return true
        } else if from.col - to.col == -6 && from.row - to.row == 6{
            return true
        } else if from.col - to.col == -7 && from.row - to.row == 7{
            return true
        } else{
            return false
        }
    }
    
    
    
    func canRookMove(from:Point, to:Point) -> Bool {
        
        if from.col - to.col == 1 && from.row - to.row == 0{
            return true
        } else if from.col - to.col == 2 && from.row - to.row == 0{
            return true
        } else if from.col - to.col == 3 && from.row - to.row == 0{
            return true
        } else if from.col - to.col == 4 && from.row - to.row == 0{
            return true
        } else if from.col - to.col == 5 && from.row - to.row == 0{
            return true
        } else if from.col - to.col == 6 && from.row - to.row == 0{
            return true
        } else if from.col - to.col == 7 && from.row - to.row == 0{
            return true
        } else if from.col - to.col == 0 && from.row - to.row == 1{
            return true
        } else if from.col - to.col == 0 && from.row - to.row == 2{
            return true
        } else if from.col - to.col == 0 && from.row - to.row == 3{
            return true
        } else if from.col - to.col == 0 && from.row - to.row == 4{
            return true
        } else if from.col - to.col == 0 && from.row - to.row == 5{
            return true
        } else if from.col - to.col == 0 && from.row - to.row == 6{
            return true
        } else if from.col - to.col == 0 && from.row - to.row == 7{
            return true
        } else if from.col - to.col == -1 && from.row - to.row == 0{
            return true
        } else if from.col - to.col == -2 && from.row - to.row == 0{
            return true
        } else if from.col - to.col == -3 && from.row - to.row == 0{
            return true
        } else if from.col - to.col == -4 && from.row - to.row == 0{
            return true
        } else if from.col - to.col == -5 && from.row - to.row == 0{
            return true
        } else if from.col - to.col == -6 && from.row - to.row == 0{
            return true
        } else if from.col - to.col == -7 && from.row - to.row == 0{
            return true
        } else if from.col - to.col == 0 && from.row - to.row == -1{
            return true
        } else if from.col - to.col == 0 && from.row - to.row == -2{
            return true
        } else if from.col - to.col == 0 && from.row - to.row == -3{
            return true
        } else if from.col - to.col == 0 && from.row - to.row == -4{
            return true
        } else if from.col - to.col == 0 && from.row - to.row == -5{
            return true
        } else if from.col - to.col == 0 && from.row - to.row == -6{
            return true
        } else if from.col - to.col == 0 && from.row - to.row == -7{
            return true
        } else {
            return false
        }
    }
    
    func canKnightMove(from: Point, to: Point) -> Bool {
        
        if to.col - from.col == 2 && to.row - from.row == 1 {
            return true
        } else if to.col - from.col == 2 && to.row - from.row == -1{
            return true
        } else if to.col - from.col == 1 && to.row - from.row == -2{
            return true
        } else if to.col - from.col == 1 && to.row - from.row == 2 {
            return true
        } else if to.col - from.col == -2 && to.row - from.row == -1 {
            return true
        } else if to.col - from.col == -2 && to.row - from.row == 1 {
            return true
        } else if to.col - from.col == -1 && to.row - from.row == -2{
            return true
        } else if to.col - from.col == -1 && to.row - from.row == 2{
            return true
        } else {
            return false
        }
    }
}
