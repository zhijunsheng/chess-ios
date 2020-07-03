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
    var lastMove: ChessMove?
    var whiteKingSideRookMoved = false
    var whiteKingMoved = false
    
    mutating func movePiece(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) {
        guard let movingPiece = pieceAt(col: fromCol, row: fromRow) else {
            return
        }
        
        if let target = pieceAt(col: toCol, row: toRow) {
            pieces.remove(target)
        }
        
        pieces.remove(movingPiece)
        pieces.insert(ChessPiece(col: toCol, row: toRow, imageName: movingPiece.imageName, isWhite: movingPiece.isWhite, rank: movingPiece.rank))
        
        if fromCol == 4 && fromRow == 7 {
            whiteKingMoved = true
        }
        
        if fromCol == 7 && fromRow == 7 {
            whiteKingSideRookMoved = true
        }
        
        if fromCol == 4 && fromRow == 7 && toCol == 6 && toRow == 7 {
            if let rook = pieceAt(col: 7, row: 7) {
                pieces.remove(rook)
                pieces.insert(ChessPiece(col: 5, row: 7, imageName: rook.imageName, isWhite: rook.isWhite, rank: rook.rank))
            }
        }

        if let lastMove = lastMove, let lastMovedPawn = pieceAt(col: lastMove.toCol, row: lastMove.toRow), lastMovedPawn.isWhite != movingPiece.isWhite, movingPiece.rank == .pawn, lastMovedPawn.rank == .pawn, abs(fromCol - toCol) == 1 && abs(fromRow - toRow) == 1 {
            pieces.remove(lastMovedPawn)
        }
        
        lastMove = ChessMove(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow)
        
        whitesTurn = !whitesTurn
    }
    
    func underThreatAt(col: Int, row: Int, fromWhite: Bool) -> Bool {
        for piece in pieces where piece.isWhite == fromWhite {
            if canMovePiece(fromCol: piece.col, fromRow: piece.row, toCol: col, toRow: row) {
                return true
            }
        }
        return false
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
        case .bishop:
            return canMoveBishop(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow)
        case .queen:
            return canMoveQueen(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow)
        case .king:
            return canMoveKing(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow)
        case .pawn:
            return canMovePawn(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow)
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
    
    func canMoveBishop(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) -> Bool {
        guard emptyBetween(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow) else {
            return false
        }
        return abs(fromCol - toCol) == abs(fromRow - toRow)
    }
    
    func canMoveQueen(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) -> Bool {
        return canMoveRook(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow) || canMoveBishop(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow)
    }
    
    func canMoveKing(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) -> Bool {
        if canCastle(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow) {
            return true
        }
        let deltaCol = abs(fromCol - toCol)
        let deltaRow = abs(fromRow - toRow)
        return (deltaCol == 1 || deltaRow == 1) && deltaCol + deltaRow < 3
    }
    
    func canCastle(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) -> Bool {
        guard let movingKing = pieceAt(col: fromCol, row: fromRow) else {
            return false
        }
        
        if movingKing.isWhite {
            if !whiteKingSideRookMoved && !whiteKingMoved && pieceAt(col: 5, row: fromRow) == nil && pieceAt(col: 6, row: fromRow) == nil {
                return movingKing.col == 4 && movingKing.row == 7 && !underThreatAt(col: 5, row: fromRow, fromWhite: !whitesTurn) && !underThreatAt(col: 6, row: fromRow, fromWhite: !whitesTurn)
            }
        }
        
        return false
    }
    
    func canMovePawn(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) -> Bool {
        guard let movingPawn = pieceAt(col: fromCol, row: fromRow) else {
            return false
        }
        
        if let target = pieceAt(col: toCol, row: toRow), target.isWhite != movingPawn.isWhite {
            return toRow == fromRow + (movingPawn.isWhite ? -1 : 1) && abs(toCol - fromCol) == 1
        } else if toCol == fromCol {
            if pieceAt(col: fromCol, row: fromRow + (movingPawn.isWhite ? -1 : 1)) == nil {
                return toRow == fromRow + (movingPawn.isWhite ? -1 : 1) ||
                    toRow == fromRow + (movingPawn.isWhite ? -2 : 2) &&
                    pieceAt(col: fromCol, row: toRow) == nil &&
                    fromRow == (movingPawn.isWhite ? 6 : 1)
            }
        } else if let lastMove = lastMove, let enemyPawn = pieceAt(col: lastMove.toCol, row: lastMove.toRow), enemyPawn.rank == .pawn && enemyPawn.isWhite != movingPawn.isWhite && enemyPawn.row == fromRow && enemyPawn.col == toCol, abs(toCol - fromCol) == 1 {
            if movingPawn.isWhite {
                return fromRow == 3 && toRow == 2 && lastMove.fromRow == 1
            } else {
                return fromRow == 4 && toRow == 5 && lastMove.fromRow == 6
            }
        }

        return false
    }
    
    func emptyBetween(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) -> Bool {
        if fromRow == toRow { // horizontal
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
        } else if fromCol == toCol { // vertical
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
        } else if abs(fromCol - toCol) == abs(fromRow - toRow) { // diagonal
            let minCol = min(fromCol, toCol)
            let maxCol = max(fromCol, toCol)
            let minRow = min(fromRow, toRow)
            let maxRow = max(fromRow, toRow)
            
            if fromRow - toRow == fromCol - toCol { // top left to bottom right \
                if maxCol - minCol < 2   {
                    return true
                }
                for i in 1..<abs(fromCol - toCol) {
                    if pieceAt(col: minCol + i, row: minRow + i) != nil {
                        return false
                    }
                }
                return true
            } else { // bottom left to top right /
                if maxCol - minCol < 2   {
                    return true
                }
                for i in 1..<abs(fromCol - toCol) {
                    if pieceAt(col: minCol + i, row: maxRow - i) != nil {
                        return false
                    }
                }
                return true
            }
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
        
        desc += "+ 0 1 2 3 4 5 6 7\n"
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

