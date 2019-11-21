//
//  ChessBoard.swift
//  chess
//
//  Created by Grace Huang on 10/20/19.
//  Copyright © 2019 GoldThumb Inc. All rights reserved.
//

import Foundation

struct ChessBoard: CustomStringConvertible{
    var pieceBox: Set<ChessPiece> = Set<ChessPiece>()
    
    mutating func reset() {
        pieceBox.insert(ChessPiece(imageName:"queen_chess_b", col: 3, row: 0, isBlack: true, pieceType:"Q"))
        pieceBox.insert(ChessPiece(imageName:"queen_chess_w", col: 3, row: 7, isBlack: false, pieceType:"Q"))
        for i in 0..<8 {
            pieceBox.insert(ChessPiece(imageName:"pawn_chess_w", col: i, row: 6, isBlack: false, pieceType:"P"))
            pieceBox.insert(ChessPiece(imageName:"pawn_chess_b", col: i, row: 1, isBlack: true, pieceType:"P"))
        }
        
        pieceBox.insert(ChessPiece(imageName:"king_chess_b", col: 4, row: 0, isBlack: true, pieceType:"K"))
        pieceBox.insert(ChessPiece(imageName:"king_chess_w", col: 4, row: 7, isBlack: false, pieceType:"K"))
        
        for i in 0..<2 {
            pieceBox.insert(ChessPiece(imageName:"rook_chess_b", col: i * 7, row: 0, isBlack: true, pieceType:"R"))
            pieceBox.insert(ChessPiece(imageName:"rook_chess_w", col: i * 7, row: 7, isBlack: false, pieceType:"R"))
            
            pieceBox.insert(ChessPiece(imageName:"bishop_chess_b", col: i * 3 + 2, row: 0, isBlack: true, pieceType:"B"))
            pieceBox.insert(ChessPiece(imageName:"bishop_chess_w", col: i * 3 + 2, row: 7, isBlack: false, pieceType:"B"))
            
            pieceBox.insert(ChessPiece(imageName:"knight_chess_b", col: i * 5 + 1, row: 0, isBlack: true, pieceType:"N"))
            pieceBox.insert(ChessPiece(imageName:"knight_chess_w", col: i * 5 + 1, row: 7, isBlack: false, pieceType:"N"))
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
        let singlePiece = pieceBox.first!
        
        
        
        var desc: String = ""
        desc += "  "

        for i in 0..<8 {
            desc += "\(i) "
        }
        
        desc += "\n"

        for row in 0..<8 {
            desc += "\(row) "

            for col in 0..<8 {
                if col == singlePiece.col && row == singlePiece.row{
                    desc += "Q "
                } else {
                    desc += ". "
                }
            }
            desc += "\n"
        }
        
        
        
        return desc
    }
    
    
}


