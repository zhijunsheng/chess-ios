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
        pieces.append(Piece(color: .black, pieceType: .rook, location: Point(row: 8, col: 1)))
        pieces.append(Piece(color: .black, pieceType: .rook, location: Point(row: 8, col: 8)))
        pieces.append(Piece(color: .black, pieceType: .knight, location: Point(row: 8, col: 2)))
        pieces.append(Piece(color: .black, pieceType: .knight, location: Point(row: 8, col: 7)))
        pieces.append(Piece(color: .black, pieceType: .bishop, location: Point(row: 8, col: 3)))
        pieces.append(Piece(color: .black, pieceType: .bishop, location: Point(row: 8, col: 6)))
        pieces.append(Piece(color: .black, pieceType: .queen, location: Point(row: 8, col: 4)))
        pieces.append(Piece(color: .black, pieceType: .king, location: Point(row: 8, col: 5)))
        
        for i in 1...8 {
            pieces.append(Piece(color: .black, pieceType: .pawn, location: Point(row: 7, col: i)))
        }
        pieces.append(Piece(color: .white, pieceType: .rook, location: Point(row: 1, col: 1)))
        pieces.append(Piece(color: .white, pieceType: .rook, location: Point(row: 1, col: 8)))
        pieces.append(Piece(color: .white, pieceType: .knight, location: Point(row: 1, col: 2)))
        pieces.append(Piece(color: .white, pieceType: .knight, location: Point(row: 1, col: 7)))
        pieces.append(Piece(color: .white, pieceType: .bishop, location: Point(row: 1, col: 3)))
        pieces.append(Piece(color: .white, pieceType: .bishop, location: Point(row: 1, col: 6)))
        pieces.append(Piece(color: .white, pieceType: .queen, location: Point(row: 1, col: 4)))
        pieces.append(Piece(color: .white, pieceType: .king, location: Point(row: 1, col: 5)))
        
        for i in 1...8 {
            pieces.append(Piece(color: .white, pieceType: .pawn, location: Point(row: 2, col: i)))
        }
    }
    
    mutating func move(targetPiece: Piece, to: Point) {
        var pieceIndex = -1
        for (i, piece) in pieces.enumerated() {
            if piece.location.row == targetPiece.location.row && piece.location.col == targetPiece.location.col {
                pieces.remove(at: i)
                pieceIndex = i
                break
            }
        }
        
        let newPiece = Piece(color: targetPiece.color, pieceType: targetPiece.pieceType, location: to)
        //        pieces.append(newPiece)
        pieces.insert(newPiece, at: pieceIndex)
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
        var row = numRows
        
        while row > a {
            //  lowercase = white
            //  upercase = black
            //  n = knight
            dots = dots + "\n"
            dots = dots + "\(row) "
            
            for col in 1...numCols {
                var pieceExists = false
                
                for piece in pieces {
                    if piece.location.row == row && piece.location.col == col {
                        
                        if piece.pieceType == .king {
                            dots += piece.color == .black ? "K " : "k "
                            pieceExists = true
                        } else if piece.pieceType == .queen{
                            dots += piece.color == .black ? "Q " : "q "
                            pieceExists = true
                        } else if piece.pieceType == .bishop{
                            dots += piece.color == .black ? "B " : "b "
                            pieceExists = true
                        } else if piece.pieceType == .knight{
                            dots += piece.color == .black ? "N " : "n "
                            pieceExists = true
                        } else if piece.pieceType == .rook{
                            dots += piece.color == .black ? "R " : "r "
                            pieceExists = true
                        } else if piece.pieceType == .pawn{
                            dots += piece.color == .black ? "P " : "p "
                            pieceExists = true
                        }
                    }
                }
                if !pieceExists{
                    dots += ". "
                }
            }
            row = row - 1
        }
        dots += "\n"
        dots += subStr
        return dots
    }
}

