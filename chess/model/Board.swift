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
        let blackrook1 = pieces[0]
        let blackrook2 = pieces[1]
        let blackknight1 = pieces[2]
        let blackknight2 = pieces[3]
        let blackbishop1 = pieces[4]
        let blackbishop2 = pieces[5]
        let blackqueen1 = pieces[6]
        let blackking1 = pieces[7]
        let blackpawn1 = pieces[8]
        let blackpawn2 = pieces[9]
        let blackpawn3 = pieces[10]
        let blackpawn4 = pieces[11]
        let blackpawn5 = pieces[12]
        let blackpawn6 = pieces[13]
        let blackpawn7 = pieces[14]
        let blackpawn8 = pieces[15]
        let whiterook1 = pieces[16]
        let whiterook2 = pieces[17]
        let whiteknight1 = pieces[18]
        let whiteknight2 = pieces[19]
        let whitebishop1 = pieces[20]
        let whitebishop2 = pieces[21]
        let whitequeen1 = pieces[22]
        let whiteking1 = pieces[23]
        let whitepawn1 = pieces[24]
        let whitepawn2 = pieces[25]
        let whitepawn3 = pieces[26]
        let whitepawn4 = pieces[27]
        let whitepawn5 = pieces[28]
        let whitepawn6 = pieces[29]
        let whitepawn7 = pieces[30]
        let whitepawn8 = pieces[31]
        
        
        while row > a {
            //  lowercase = white
            //  upercase = black
            //  n = knight
            dots = dots + "\n"
            dots = dots + "\(row) "
            for col in 1...numCols {
                if row == blackrook1.location.row && col == blackrook1.location.col {
                    dots += "R "
                } else if row == blackrook2.location.row && col == blackrook2.location.col {
                    dots += "R "
                } else if row == blackknight1.location.row && col == blackknight1.location.col {
                    dots += "N "
                } else if row == blackknight2.location.row && col == blackknight2.location.col {
                    dots += "N "
                } else if row == blackbishop1.location.row && col == blackbishop1.location.col {
                    dots += "B "
                } else if row == blackbishop2.location.row && col == blackbishop2.location.col {
                    dots += "B "
                } else if row == blackqueen1.location.row && col == blackqueen1.location.col {
                    dots += "Q "
                } else if row == blackking1.location.row && col == blackking1.location.col {
                    dots += "K "
                } else if row == blackpawn1.location.row && col == blackpawn1.location.col {
                    dots += "P "
                } else if row == blackpawn2.location.row && col == blackpawn2.location.col {
                    dots += "P "
                } else if row == blackpawn3.location.row && col == blackpawn3.location.col {
                    dots += "P "
                } else if row == blackpawn4.location.row && col == blackpawn4.location.col {
                    dots += "P "
                } else if row == blackpawn5.location.row && col == blackpawn5.location.col {
                    dots += "P "
                } else if row == blackpawn6.location.row && col == blackpawn6.location.col {
                    dots += "P "
                } else if row == blackpawn7.location.row && col == blackpawn7.location.col {
                    dots += "P "
                } else if row == blackpawn8.location.row && col == blackpawn8.location.col {
                    dots += "P "
                } else if row == whiterook1.location.row && col == whiterook1.location.col {
                    dots += "r "
                } else if row == whiterook2.location.row && col == whiterook2.location.col {
                    dots += "r "
                } else if row == whiteknight1.location.row && col == whiteknight1.location.col {
                    dots += "n "
                } else if row == whiteknight2.location.row && col == whiteknight2.location.col {
                    dots += "n "
                } else if row == whitebishop1.location.row && col == whitebishop1.location.col {
                    dots += "b "
                } else if row == whitebishop2.location.row && col == whitebishop2.location.col {
                    dots += "b "
                } else if row == whitequeen1.location.row && col == whitequeen1.location.col {
                    dots += "q "
                } else if row == whiteking1.location.row && col == whiteking1.location.col {
                    dots += "k "
                } else if row == whitepawn1.location.row && col == whitepawn1.location.col {
                    dots += "p "
                } else if row == whitepawn2.location.row && col == whitepawn2.location.col {
                    dots += "p "
                } else if row == whitepawn3.location.row && col == whitepawn3.location.col {
                    dots += "p "
                } else if row == whitepawn4.location.row && col == whitepawn4.location.col {
                    dots += "p "
                } else if row == whitepawn5.location.row && col == whitepawn5.location.col {
                    dots += "p "
                } else if row == whitepawn6.location.row && col == whitepawn6.location.col {
                    dots += "p "
                } else if row == whitepawn7.location.row && col == whitepawn7.location.col {
                    dots += "p "
                } else if row == whitepawn8.location.row && col == whitepawn8.location.col {
                    dots += "p "
                } else {
                    dots = dots + ". "
                }
            }
            row = row - 1
        }
        dots += "\n"
        dots += subStr
        return dots
    }
}
