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
        pieces.append(Piece(color: .white, pieceType: .knight, location: Point(row: 1, col: 7)))
        pieces.append(Piece(color: .white, pieceType: .rook, location: Point(row: 1, col: 1)))
        pieces.append(Piece(color: .white, pieceType: .rook, location: Point(row: 1, col: 8)))
        pieces.append(Piece(color: .white, pieceType: .bishop, location: Point(row: 1, col: 3)))
        pieces.append(Piece(color: .white, pieceType: .bishop, location: Point(row: 1, col: 6)))
        pieces.append(Piece(color: .white, pieceType: .king, location: Point(row: 1, col: 5)))
        pieces.append(Piece(color: .white, pieceType: .queen, location: Point(row: 1, col: 4)))
        
        pieces.append(Piece(color: .black, pieceType: .knight, location: Point(row: 8, col: 2)))
        pieces.append(Piece(color: .black, pieceType: .knight, location: Point(row: 8, col: 7)))
        pieces.append(Piece(color: .black, pieceType: .rook, location: Point(row: 8, col: 1)))
        pieces.append(Piece(color: .black, pieceType: .rook, location: Point(row: 8, col: 8)))
        pieces.append(Piece(color: .black, pieceType: .bishop, location: Point(row: 8, col: 3)))
        pieces.append(Piece(color: .black, pieceType: .bishop, location: Point(row: 8, col: 6)))
        pieces.append(Piece(color: .black, pieceType: .king, location: Point(row: 8, col: 5)))
        pieces.append(Piece(color: .black, pieceType: .queen, location: Point(row: 8, col: 4)))
        for i in 1...8 {
            pieces.append(Piece(color: .white, pieceType: .pawn, location: Point(row: 2, col: i)))
            pieces.append(Piece(color: .black, pieceType: .pawn, location: Point(row: 7, col: i)))
        }
        
        // Homework: add all pieces on board, add pieces in board description,
    }
    
    func canRookMove(from:Point, to:Point) -> Bool{
        if abs(from.row - to.row) > 7 || abs(from.row - to.row) < 1 || abs(from.col - to.col) > 7 || abs(from.col - to.col) < 1 {
            return false
        } else {
            return true
        }
    }
    
    func canBishopMove(from:Point, to:Point) -> Bool{
        if abs(from.row - to.row) > 7 || abs(from.row - to.row) < 1 || abs(from.col - to.col) > 7 || abs(from.col - to.col) < 1 {
            return false
        } else {
            return true
        }
    }
    
    func canKingMove(from:Point, to:Point) -> Bool{
        if abs(from.row - to.row) > 7 || abs(from.row - to.row) < 1 || abs(from.col - to.col) > 7 || abs(from.col - to.col) < 1 {
            return false
        } else {
            return true
        }
    }
   
    func canPawnMove(from:Point, to:Point) -> Bool{
        if abs(from.row - to.row) > 7 || abs(from.row - to.row) < 1 || abs(from.col - to.col) > 7 || abs(from.col - to.col) < 1 {
            return false
        } else {
            return true
        }
    }
    
    // func canQueenMove(to:Point) -> Bool{
    func canQueenMove(from:Point, to:Point) -> Bool{
        if abs(from.row - to.row) > 7 || abs(from.row - to.row) < 1 || abs(from.col - to.col) > 7 || abs(from.col - to.col) < 1 {
            return false
        } else {
            return true
        }
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
            for c in 1...numCols {
                if b == 2 {
                    //  lowercase = white
                    //  upercase = black
                    //  n = knight
                    dots = dots + "p "
                } else if b == 7 {
                    dots = dots + "P "
                } else if b == 8 && c == 1 || b == 8 && c == 8 {
                    dots = dots + "R "
                } else if b == 1 && c == 1 || b == 1 && c == 8 {
                    dots = dots + "r "
                } else if b == 8 && c == 2 || b == 8 && c == 7 {
                    dots = dots + "N "
                } else if b == 1 && c == 2 || b == 1 && c == 7 {
                    dots = dots + "n "
                } else if b == 1 && c == 3 || b == 1 && c == 6 {
                    dots += "b "
                } else if b == 8 && c == 3 || b == 8 && c == 6 {
                    dots += "B "
                } else if b == 8 && c == 4 {
                    dots += "Q "
                } else if b == 1 && c == 4 {
                    dots += "q "
                } else if b == 8 && c == 5 {
                    dots += "K "
                } else if b == 1 && c == 5 {
                    dots += "k "
                } else {
                    dots = dots + ". "
                }
            }
            b = b - 1
        }
        dots += "\n"
        dots += subStr
        return dots
    }
}
