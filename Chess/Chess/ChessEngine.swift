//
//  ChessEngine.swift
//  Chess
//
//  Created by Zhijun Sheng on 2020-06-03.
//  Copyright © 2020 Gold Thumb Inc. All rights reserved.
//

import Foundation

struct ChessEngine {
    var pieces: Set<ChessPiece> = Set<ChessPiece>()
    var whitesTurn: Bool = true
    
    mutating func movePiece(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) {
        guard let movingPiece = pieceAt(col: fromCol, row: fromRow) else {
            return
        }
        
        if let target = pieceAt(col: toCol, row: toRow) {
            pieces.remove(target)
        }
        
        pieces.remove(movingPiece)
        pieces.insert(ChessPiece(col: toCol, row: toRow, imageName: movingPiece.imageName, isWhite: movingPiece.isWhite, rank: movingPiece.rank))
        
        whitesTurn = !whitesTurn
    }
    
    func canMovePiece(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) -> Bool {
        if toCol < 0 || toCol > 7 || toRow < 0 || toRow > 7 {
            return false
        }
        
        if fromCol == toCol && fromRow == toRow {
            return false
        }
        
        guard let movingPiece = pieceAt(col: fromCol, row: fromRow) else {
            return false
        }
        
        if let target = pieceAt(col: toCol, row: toRow), target.isWhite == movingPiece.isWhite  {
            return false
        }
        
        if movingPiece.isWhite != whitesTurn {
            return false
        }
        
        switch movingPiece.rank {
        case .knight:
            return canMoveKnight(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow)
        case .rook:
            return canMoveRook(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow)
        default:
            return true
        }
    }
    
    func canMoveKnight(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) -> Bool {
        return abs(fromCol - toCol) == 1 && abs(fromRow - toRow) == 2 || abs(fromRow - toRow) == 1 && abs(fromCol - toCol) == 2
    }
    
    func canMoveRook(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) -> Bool {
        guard emptyBetween(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow) else {
            return false
        }
        return fromCol == toCol || fromRow == toRow
    }
    
    func emptyBetween(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) -> Bool {
        if fromRow == toRow {
            let minCol = min(fromCol, toCol)
            let maxCol = max(fromCol, toCol)
            if maxCol - minCol < 2   {
                return true
            }
            for i in minCol + 1 ... maxCol - 1 {
                if pieceAt(col: i, row: fromRow) != nil {
                    return false
                }
            }
            return true
        } else if fromCol == toCol {
            let minRow = min(fromRow, toRow)
            let maxRow = max(fromRow, toRow)
            if maxRow - minRow < 2   {
                return true
            }
            for i in minRow + 1 ... maxRow - 1 {
                if pieceAt(col: fromCol, row: i) != nil {
                    return false
                }
            }
            return true
        }
        
        return false
    }
    
    func emptyBetween(from: Int, to: Int, constant: Int) -> Bool {
        let minCol = min(from, to)
        let maxCol = max(from, to)
        if maxCol - minCol < 2   {
            return true
        }
        for i in minCol + 1 ... maxCol - 1 {
            if pieceAt(col: i, row: constant) != nil {
                return false
            }
        }
        return true
    }
    
    func pieceAt(col: Int, row: Int) -> ChessPiece? {
        for piece in pieces {
            if col == piece.col && row == piece.row {
                return piece
            }
        }
        return nil
    }
    
    mutating func initializeGame() {
        whitesTurn = true
        
        pieces.removeAll()
        
        for i in 0..<2 {
            pieces.insert(ChessPiece(col: i * 7, row: 0, imageName: "Rook-black", isWhite: false, rank: .rook))
            pieces.insert(ChessPiece(col: i * 7, row: 7, imageName: "Rook-white", isWhite: true, rank: .rook))
            pieces.insert(ChessPiece(col: 1 + i * 5, row: 0, imageName: "Knight-black", isWhite: false, rank: .knight))
            pieces.insert(ChessPiece(col: 1 + i * 5, row: 7, imageName: "Knight-white", isWhite: true, rank: .knight))
            pieces.insert(ChessPiece(col: 2 + i * 3, row: 0, imageName: "Bishop-black", isWhite: false, rank: .bishop))
            pieces.insert(ChessPiece(col: 2 + i * 3, row: 7, imageName: "Bishop-white", isWhite: true, rank: .bishop))
        }
        
        pieces.insert(ChessPiece(col: 3, row: 0, imageName: "Queen-black", isWhite: false, rank: .queen))
        pieces.insert(ChessPiece(col: 3, row: 7, imageName: "Queen-white", isWhite: true, rank: .queen))
        pieces.insert(ChessPiece(col: 4, row: 0, imageName: "King-black", isWhite: false, rank: .king))
        pieces.insert(ChessPiece(col: 4, row: 7, imageName: "King-white", isWhite: true, rank: .king))
        
        for col in 0..<8 {
            pieces.insert(ChessPiece(col: col, row: 1, imageName: "Pawn-black", isWhite: false, rank: .pawn))
            pieces.insert(ChessPiece(col: col, row: 6, imageName: "Pawn-white", isWhite: true, rank: .pawn))
        }
    }
}

extension ChessEngine: CustomStringConvertible {
    var description: String {
        var desc = ""
        
        desc += "  0 1 2 3 4 5 6 7\n"
        for row in 0..<8 {
            desc += "\(row)"
            for col in 0..<8 {
                if let piece = pieceAt(col: col, row: row) {
                    switch piece.rank {
                    case .king:
                        desc += piece.isWhite ? " k" : " K"
                    case .queen:
                        desc += piece.isWhite ? " q" : " Q"
                    case .bishop:
                        desc += piece.isWhite ? " b" : " B"
                    case .knight:
                        desc += piece.isWhite ? " n" : " N"
                    case .rook:
                        desc += piece.isWhite ? " r" : " R"
                    case .pawn:
                        desc += piece.isWhite ? " p" : " P"
                    }
                } else {
                    desc += " ."
                }
            }
            desc += "\n"
        }
        
        return desc
    }
}

