//
//  Board.swift
//  chess
//
//  Created by Bowen Lin on 2018-01-30.
//  Copyright © 2018 GoldThumb Inc. All rights reserved.
//

import Foundation

struct Board: CustomStringConvertible {
    
    let numRows: Int
    let numCols: Int
    var pieces: [Piece]
    
    
    init() {
        numRows = 8
        numCols = 8
        pieces = [Piece]()
        initializeBoard()
    
    }
    
    mutating func initializeBoard(){
        pieces.append(Piece(color: .white, pieceType: .knight, location: Point(row: 1, col: 2)))
        pieces.append(Piece(color: .white, pieceType: .rook, location: Point(row: 1, col: 1)))
        
        // Homework: add all pieces on board, add pieces in board description,
    }
    
    func canRookMove(from:Point, to:Point) -> Bool{
        // TODO
        return false
    }
    
    func canBishopMove(from:Point, to:Point) -> Bool{
        // TODO
        return false
    }
    
    func canKingMove(from:Point, to:Point) -> Bool{
        // TODO
        return false
    }
    func canPawnMove(from:Point, to:Point) -> Bool{
        // TODO
        return false
    }
    
    // func canQueenMove(to:Point) -> Bool{
    func canQueenMove(from:Point, to:Point) -> Bool{
        
        
        // TODO
        return false
    }
    var description: String {
        var dots = ""
        let a = 0
        let markRow = "+ A B C D E F G H J K L M N O P Q R S T"
        let c = numCols * 2 + 1 
        let strArray = Array(markRow)
        let subStr = strArray[0...c]
        
        var b = numRows
        
        while b > a {
            dots = dots + "\n"
            dots = dots + "\(b) "
            for _ in 1...numCols {
                dots = dots + ". "
            
            }
            b = b - 1
        }
        dots += "\n"
        dots += subStr
        return dots
    }
}
