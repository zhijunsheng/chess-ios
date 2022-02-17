//
//  ChessGame.swift
//  chess
//
//  Created by Kenneth Wu on 2022-02-16.
//  Copyright © 2022 GoldThumb Inc. All rights reserved.
//

import Foundation

struct ChessGame {
    var pieces: Set<ChessPiece> = []
    
    mutating func movePiece(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) {
        if let wherePiece = pieceAt(col: fromCol, row: fromRow) {
            pieces.remove(wherePiece)
            
            pieces.insert(ChessPiece(col: toCol, row: toRow, whatPiece: wherePiece.whatPiece, isWhite: wherePiece.isWhite, imageName: wherePiece.imageName))
        }
        
        
    }
    
    mutating func reset() {
        for i in 0 ..< 8 {
            pieces.insert(ChessPiece(col: i, row: 1, whatPiece: .pawn, isWhite: false, imageName: "pawn_chess_b"))
            pieces.insert(ChessPiece(col: i, row: 6, whatPiece: .pawn, isWhite: true, imageName: "pawn_chess_w"))
        }
        for i in 0 ..< 2 {
            
            pieces.insert(ChessPiece(col: 2 + i * 3, row: 0, whatPiece: .bishop, isWhite: false, imageName: "bishop_chess_b"))
            pieces.insert(ChessPiece(col: 2 + i * 3, row: 7, whatPiece: .bishop, isWhite: true, imageName: "bishop_chess_w"))
            
            pieces.insert(ChessPiece(col: i * 7, row: 0, whatPiece: .rook, isWhite: false, imageName: "rook_chess_b"))
            pieces.insert(ChessPiece(col: i * 7, row: 7, whatPiece: .rook, isWhite: false, imageName: "rook_chess_w"))
            
            pieces.insert(ChessPiece(col: 1 + i * 5, row: 0, whatPiece: .knight, isWhite: false, imageName: "knight_chess_b"))
            pieces.insert(ChessPiece(col: 1 + i * 5, row: 7, whatPiece: .knight, isWhite: false, imageName: "knight_chess_w"))
        }

        pieces.insert(ChessPiece(col: 4, row: 0, whatPiece: .king, isWhite: false, imageName: "king_chess_b"))
        pieces.insert(ChessPiece(col: 4, row: 7, whatPiece: .king, isWhite: true, imageName: "king_chess_w"))
        
        pieces.insert(ChessPiece(col: 3, row: 0, whatPiece: .queen, isWhite: false, imageName: "queen_chess_b"))
        pieces.insert(ChessPiece(col: 3, row: 7, whatPiece: .queen, isWhite: true, imageName: "queen_chess_w"))
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
