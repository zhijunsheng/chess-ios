//
//  ChessBoard.swift
//  chess
//
//  Created by Halwong on 2019/9/20.
//  Copyright © 2019 GoldThumb Inc. All rights reserved.
//

import Foundation

/*
 
 design pattern MVC
 
 M: Model, ChessBoard
 V: View, BoardView
 C: Controller, GameViewController
 
 */
struct ChessBoard: CustomStringConvertible {
    
    var pieces: Set<ChessPiece> = Set<ChessPiece>()
    
    mutating func initializeBoard() {
        for i in 0 ..< 8 {
            pieces.insert(ChessPiece(rank: .pawn, col: i, row: 1, isWhite: false, imgName: "pawn_chess_b"))
            pieces.insert(ChessPiece(rank: .pawn, col: i, row: 6, isWhite: true, imgName: "pawn_chess_w"))
        }
    }
    
    /*
 
     0 1 2 3 4 5 6 7
   0 . . . . . . . .
   1 . . . . . . . .
   2 . . . . . . . .
   3 . . . . . . . .
   4 . . . . . . . .
   5 . . . . . . . .
   6 . . . . . . . .
   7 . . . . . . . .
     
    */
    var description: String {
        var boardString: String =  " "

        for i in 0 ..< 8 {
            boardString += " \(i)"
        }
        for row in 0 ..< 8 {
            boardString += "\n"
            boardString += "\(row)"
            for col in 0 ..< 8 {
                let piece = pieceAt(col: col, row: row)
                if piece?.rank == .pawn {
                    boardString += " P"
                } else if piece?.rank == .rook {
                    boardString += " R"
                } else {
                    boardString += " ."
                }
            }
        }
        return boardString
    }
    
    func pieceAt(col: Int, row: Int) -> ChessPiece? {
        for piece in pieces {
            if piece.col == col && piece.row == row {
                return piece
            }
        }
        return nil
    }
}
