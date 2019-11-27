//
//  ChessGameEngine.swift
//  chess
//
//  Created by Elaine on 2019/10/27.
//  Copyright © 2019 GoldThumb Inc. All rights reserved.
//

import Foundation

struct ChessGameEngine: CustomStringConvertible {
    
    var box: Set<ChessPiece> = Set<ChessPiece>()
    
    mutating func movePiece(startingCol: Int, startingRow: Int, endingCol: Int, endingRow: Int) {
         print(startingRow)
         print(startingCol)
         print(endingCol)
         print(endingRow)
        
        guard let movingPiece = pieceAt(col: startingCol, row: startingRow) else {
            return
        }
        
         print(movingPiece.imageName)
        
        box.remove(movingPiece)
        
        box.insert(ChessPiece(rank: movingPiece.rank, isWhite: movingPiece.isWhite, col: endingCol, row: endingRow, imageName: movingPiece.imageName))
    }
    
    mutating func initialize() {
        
        box.insert(ChessPiece(rank: "queen", isWhite: true, col: 3, row: 7, imageName: "queen_chess_w"))
        box.insert(ChessPiece(rank: "king", isWhite: true, col: 4, row: 7, imageName: "king_chess_w"))
        
        box.insert(ChessPiece(rank: "queen", isWhite: false, col: 3, row: 0, imageName: "queen_chess_b"))
        box.insert(ChessPiece(rank: "king", isWhite: false, col: 4, row: 0, imageName: "king_chess_b"))
        
        for i in 0..<2 {
            box.insert(ChessPiece(rank: "rook", isWhite: true, col: i * 7, row: 7, imageName: "rook_chess_w"))
            box.insert(ChessPiece(rank: "bishop", isWhite: true, col: i * 3 + 2, row: 7, imageName: "bishop_chess_w"))
            box.insert(ChessPiece(rank: "horse", isWhite: true, col: i * 5 + 1, row: 7, imageName: "knight_chess_w"))
            
            box.insert(ChessPiece(rank: "rook", isWhite: false, col: i * 7, row: 0, imageName: "rook_chess_b"))
            box.insert(ChessPiece(rank: "bishop", isWhite: false, col: i * 3 + 2, row: 0, imageName: "bishop_chess_b"))
            box.insert(ChessPiece(rank: "horse", isWhite: false, col: i * 5 + 1, row: 0, imageName: "knight_chess_b"))
        }
        for q in 0...7 {
            box.insert(ChessPiece(rank: "pawn", isWhite: false, col: q, row: 1, imageName: "pawn_chess_b"))
            box.insert(ChessPiece(rank: "pawn", isWhite: true, col: q, row: 6, imageName: "pawn_chess_w"))
        }
    }
    
    func pieceAt(col: Int, row: Int) -> ChessPiece? {
        for aPiece in box {
            if aPiece.col == col && aPiece.row == row   {
                print("Yay")
                return aPiece
            }
        }
        return nil
    }
    // Set<Int>
    // [4, 5, 77]
    
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
    var description: String { // "a", "b", " ", "7", "\n"
        var desc = " "
        for f in 0..<8 {
            desc += " \(f)"
        }
        for t in 0..<8 {
            desc += "\n"
            desc += "\(t)"
            for b in 0..<8 {
                desc += " ."
            }
        }
        return desc
    }
}



