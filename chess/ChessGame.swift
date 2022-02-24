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
        
        guard let piece = pieceAt(col: fromCol, row: fromRow) else { return }
        
        if canPieceMove(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow) {
            
            if let targetPiece = pieceAt(col: toCol, row: toRow) {
                if targetPiece.isWhite != piece.isWhite {
                    pieces.remove(targetPiece)
                }
            }
            
            pieces.remove(piece)
            pieces.insert(ChessPiece(col: toCol, row: toRow, whatPiece: piece.whatPiece, isWhite: piece.isWhite, imageName: piece.imageName))
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
            pieces.insert(ChessPiece(col: i * 7, row: 7, whatPiece: .rook, isWhite: true, imageName: "rook_chess_w"))
            
            pieces.insert(ChessPiece(col: 1 + i * 5, row: 0, whatPiece: .knight, isWhite: false, imageName: "knight_chess_b"))
            pieces.insert(ChessPiece(col: 1 + i * 5, row: 7, whatPiece: .knight, isWhite: true, imageName: "knight_chess_w"))
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
    func canPieceMove(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) -> Bool {
        guard let piece = pieceAt(col: fromCol, row: fromRow) else {
            return false
        }
        if let targetPiece = pieceAt(col: toCol, row: toRow) {
            if targetPiece.isWhite == piece.isWhite {
                return false
            }

        }
        
        switch piece.whatPiece {
        case .rook:
            return canRookMove(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow)
        case .pawn:
            return canPawnMove(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow, isWhite: piece.isWhite)
        case .king:
            return canKingMove(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow)
        case .knight:
            return canKnightMove(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow)
        case .bishop:
            return canBishopMove(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow)
        case .queen:
            return canQueenMove(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow)
        }
    }
    
    func canRookMove(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) -> Bool {
        return fromRow == toRow || fromCol == toCol
    }
    func canPawnMove(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int, isWhite: Bool) -> Bool {
        return true
        
        
        
    }
    
    func canKingMove(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) -> Bool {
        return toCol == fromCol && abs(toRow - fromRow) ==  1 ||
        abs(toCol - fromCol) == 1 && toRow == fromRow ||
        abs(toCol - fromCol) == 1 && abs(toRow - fromRow) ==  1
    }
    func canKnightMove(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) -> Bool {
        return abs(toCol - fromCol) == 1 && abs(toRow - fromRow) == 2 ||
        abs(toCol - fromCol) == 2 && abs(toRow - fromRow) == 1
    }
    func canBishopMove(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) -> Bool {
        return abs(fromCol - toCol) == abs(fromRow - toRow)
    }
    func canQueenMove(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) -> Bool {
        return canBishopMove(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow) || canRookMove(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow)
        
    }
}
