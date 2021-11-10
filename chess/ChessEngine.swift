//
//  ChessEngine.swift
//  chess
//
//  Created by Felix Lo on 2020/7/29.
//  Copyright © 2020 GoldThumb Inc. All rights reserved.
//

import Foundation

struct ChessEngine: CustomStringConvertible {
    
    
    
    var pieces: Set<Piece> = []
    
    mutating func initGame() {
        pieces.insert(Piece(col: 3, row: 7, player: .white, rank: .queen, imageName: "queen_w"))
        pieces.insert(Piece(col: 4, row: 7, player: .white, rank: .king, imageName: "king_w"))
        pieces.insert(Piece(col: 3, row: 0, player: .black, rank: .queen, imageName: "queen_b"))
        pieces.insert(Piece(col: 4, row: 0, player: .black, rank: .king, imageName: "king_b"))
        
        for i in 0 ..< 8 {
            pieces.insert(Piece(col: i, row: 6, player: .white, rank: .pawn, imageName: "pawn_w"))
            pieces.insert(Piece(col: i, row: 1, player: .black, rank: .pawn, imageName: "pawn_b"))
        }
        
        for i in 0 ..< 2 {
            pieces.insert(Piece(col: i * 7, row: 0, player: .black, rank: .rook, imageName: "rook_b"))
            pieces.insert(Piece(col: i * 5 + 1, row: 0, player: .black, rank: .knight, imageName: "knight_b"))
            pieces.insert(Piece(col: i * 3 + 2, row: 0, player: .black, rank: .bishop, imageName: "bishop_b"))
            pieces.insert(Piece(col: i * 7, row: 7, player: .white, rank: .rook, imageName: "rook_w"))
            pieces.insert(Piece(col: i * 5 + 1, row: 7, player: .white, rank: .knight, imageName: "knight_w"))
            pieces.insert(Piece(col: i * 3 + 2, row: 7, player: .white, rank: .bishop, imageName: "bishop_w"))
        }
    }
    
    func pieceAt(col: Int, row: Int) -> Piece? {
        for piece in pieces {
            if col == piece.col && row == piece.row {
                return piece
            }
        }
        
        return nil
    }
    
    mutating func moveP(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) {
        guard let movingPiece = pieceAt(col: fromCol, row: fromRow) else {
            return
        }
        
        if let pieceGone = pieceAt(col: toCol, row: toRow) {
            if pieceGone.player != movingPiece.player {
                pieces.remove(pieceGone)
            }
        }
        
        pieces.remove(movingPiece)
        pieces.insert(Piece(col: toCol, row: toRow, player: movingPiece.player, rank: movingPiece.rank, imageName: movingPiece.imageName))
    }
    
    func canPieceMove(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) -> Bool {
        guard let movingPiece = pieceAt(col: fromCol, row: fromRow) else {
            return false
        }
        
        switch movingPiece.rank {
        case .pawn:
            return canPawnMove(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow)
        case .knight:
            return canKnightMove(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow)
        case .bishop:
            return canBishopMove(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow)
        case .rook:
            return canRookMove(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow)
        case .queen:
            return canQueenMove(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow)
        case .king:
            return canKingMove(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow)
        }
    }
    
    func canRookMove(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) -> Bool {
        return fromCol == toCol || fromRow == toRow
    }
    
    func canBishopMove(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) -> Bool {
        return abs(fromCol - toCol) == abs(fromRow - toRow)
    }
    
    func canQueenMove(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) -> Bool {
        return canBishopMove(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow) ||
            canRookMove(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow)
    }
    
    func canKnightMove(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) -> Bool {
        return abs(fromCol - toCol) == 2 && abs(fromRow - toRow) == 1 ||
            abs(fromCol - toCol) == 1 && abs(fromRow - toRow) == 2
    }
    
    func canPawnMove(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) -> Bool {
        guard let movingPiece = pieceAt(col: fromCol, row: fromRow) else {
            return false
        }
        
        if let enemyPiece = pieceAt(col: toCol, row: toRow) {
            if enemyPiece.player == movingPiece.player {
                return false
            } else if enemyPiece.player != movingPiece.player {
              return abs(fromCol - toCol) == 1 && abs(fromRow - toRow) == 1
            }
            
        }
        
        if movingPiece.player == .black {
            if movingPiece.row == 1 && fromCol == toCol {
                return toRow == fromRow + 1 || toRow == fromRow + 2
            }
            
            return toRow == fromRow + 1 && fromCol == toCol
        } else {
            if movingPiece.row == 6 && fromCol == toCol {
                return toRow == fromRow - 1 || toRow == fromRow - 2
            }
            
            return toRow == fromRow - 1 && fromCol == toCol
        }
    }
    
    func canKingMove(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) -> Bool {
        return fromCol == toCol && abs(fromRow - toRow) == 1 ||
            abs(fromCol - toCol) == 1 && abs(fromRow - toRow) == 1 ||
            abs(fromCol - toCol) == 1 && fromRow == toRow
    }
    
    var description: String {
        var desc = "  "
        
        for i in 0 ..< 8 {
            desc += "\(i) "
        }
        
        desc += "\n"
        
        for r in 0 ..< 8 {
            desc += "\(r) "
            for c in 0 ..< 8 {
                if let piece = pieceAt(col: c, row: r) {
                    switch piece.rank {
                    case .bishop:
                        desc += piece.player == .black ? "B " : "b "
                    case .pawn:
                        desc += piece.player == .black ? "P " : "p "
                    case .knight:
                        desc += piece.player == .black ? "N " : "n "
                    case .rook:
                        desc += piece.player == .black ? "R " : "r "
                    case .queen:
                        desc += piece.player == .black ? "Q " : "q "
                    case .king:
                        desc += piece.player == .black ? "K " : "k "
                    }
                } else {
                    desc += ". "
                }
            }
            desc += "\n"
        }
        return desc
    }
    
}
