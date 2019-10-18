//
//  ChessBoard.swift
//  chess
//
//  Created by Halwong on 2019/9/20.
//  Copyright © 2019 GoldThumb Inc. All rights reserved.
//

import Foundation

/*
 
 design pattern MVCq
 
 M: Model, ChessBoard
 V: View, BoardView
 C: Controller, GameViewController
 
 */
struct ChessBoard: CustomStringConvertible {
    
    // capture a piece, eat
    
    var pieces: Set<ChessPiece> = Set<ChessPiece>()
    
    func canKnightMove(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) -> Bool {
        return abs(toCol - fromCol) == 1 && abs(toRow - fromRow) == 2 ||
               abs(toCol - fromCol) == 2 && abs(toRow - fromRow) == 1
    }
    
    mutating func movePiece(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) {
        
        guard let movingPiece = pieceAt(col: fromCol, row: fromRow) else {
            return
        }
        
        if let targetPiece = pieceAt(col: toCol, row: toRow) {
            pieces.remove(targetPiece)
        }
        
        pieces.remove(movingPiece)
        pieces.insert(ChessPiece(rank: movingPiece.rank, col: toCol, row: toRow, isWhite: movingPiece.isWhite, imgName: movingPiece.imgName))
        
    }
    
    mutating func initializeBoard() {
        for i in 0 ..< 8 {
            pieces.insert(ChessPiece(rank: .pawn, col: i, row: 1, isWhite: false, imgName: "pawn_chess_b"))
            pieces.insert(ChessPiece(rank: .pawn, col: i, row: 6, isWhite: true, imgName: "pawn_chess_w"))
        }
        for i in 0 ..< 2 {
            pieces.insert(ChessPiece(rank: .rook, col: 7 * i, row: 0, isWhite: false, imgName: "rook_chess_b"))
            pieces.insert(ChessPiece(rank: .rook, col: 7 * i, row: 7, isWhite: true, imgName: "rook_chess_w"))
            pieces.insert(ChessPiece(rank: .knight, col: i * 5 + 1, row: 0, isWhite: false, imgName: "knight_chess_b"))
            pieces.insert(ChessPiece(rank: .knight, col: i * 5 + 1, row: 7, isWhite: true, imgName: "knight_chess_w"))
            pieces.insert(ChessPiece(rank: .bishop, col: i * 3 + 2, row: 0, isWhite: false, imgName: "bishop_chess_b"))
            pieces.insert(ChessPiece(rank: .bishop, col: i * 3 + 2, row: 7, isWhite: true, imgName: "bishop_chess_w"))
        }
        pieces.insert(ChessPiece(rank: .queen, col: 3, row: 0, isWhite: false, imgName: "queen_chess_b"))
        pieces.insert(ChessPiece(rank: .queen, col: 3, row: 7, isWhite: true, imgName: "queen_chess_w"))
        pieces.insert(ChessPiece(rank: .king, col: 4, row: 0, isWhite: false, imgName: "king_chess_b"))
        pieces.insert(ChessPiece(rank: .king, col: 4, row: 7, isWhite: true, imgName: "king_chess_w"))
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
