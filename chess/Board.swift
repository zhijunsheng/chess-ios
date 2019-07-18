//
//  Board.swift
//  chess
//
//  Created by Peter Shi on 2018-10-30.
//  Copyright © 2018 GoldThumb Inc. All rights reserved.
//

import Foundation
/*
 r n b k q b n r
 p p p p p p p p
 . . . . . . . .
 . . . . . . . .
 . . . . . . . .
 . . . . . . . .
 P P P P P P P P
 R N B Q K B N R

 */
struct Board: CustomStringConvertible {
    let cols = 8
    let rows = 8
    var isWhiteTurn: Bool = true
    
    
    var pieces: Set<Piece> = Set<Piece>()
    
    mutating func movePiece(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) {
        guard let piece = pieceOn(row: fromRow, col: fromCol) else {
            return
        }

        if canMove(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow) {
            if capturePiece(pieceCol: fromCol, pieceRow: fromRow, col: toCol, row: toRow) {
                guard let target = pieceOn(row: toRow, col: toCol) else {
                    return
                }
                pieces.remove(target)
                pieces.remove(piece)
                pieces.insert(Piece(row: toRow, col: toCol, imageName: piece.imageName, isWhite: piece.isWhite, rank: piece.rank))
                isWhiteTurn = !isWhiteTurn
            } else {
                pieces.remove(piece)
                pieces.insert(Piece(row: toRow, col: toCol, imageName: piece.imageName, isWhite: piece.isWhite, rank: piece.rank))
                isWhiteTurn = !isWhiteTurn
            }
        }
    }
    
    func canMove(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) -> Bool {
        guard let candidate = pieceOn(row: fromRow, col: fromCol) else {
            return false
        }
        
        if isDestOutOfBoard(destRow: toRow, destCol: toCol) ||
           isDestOnOwnPieces(destRow: toRow, destCol: toCol, isWhite: candidate.isWhite) ||
           candidate.isWhite != isWhiteTurn {
            return false
        }
        switch candidate.rank {
        case .pawn:
            return canPawnMoveFrom(fromRow: fromRow, fromCol: fromCol, toRow: toRow, toCol: toCol, isWhite: candidate.isWhite)
        case .knight:
            return canKnightMoveFrom(fromRow: fromRow, fromCol: fromCol, toRow: toRow, toCol: toCol)
        case .bishop:
            return canBishopMoveFrom(fromRow: fromRow, fromCol: fromCol, toRow: toRow, toCol: toCol)
        case .rook:
            return canRookMoveFrom(fromRow: fromRow, fromCol: fromCol, toRow: toRow, toCol: toCol)
        case .king:
            return canKingMoveFrom(fromRow: fromRow, fromCol: fromCol, toRow: toRow, toCol: toCol)
        case .queen:
            return canQueenMoveFrom(fromRow: fromRow, fromCol: fromCol, toRow: toRow, toCol: toCol)
        }
    }
    
    func pieceOn(row: Int, col: Int) -> Piece? {
        for piece in pieces {
            if row == piece.row && col == piece.col {
                return piece
            }
        }
        return nil
    }
    
    func isDestOutOfBoard(destRow: Int, destCol: Int) -> Bool {
        if destRow < 0 || destCol < 0 || destRow > 7 || destCol > 7 {
            return true
        }
        return false
    }
    
    func isDestOnOwnPieces(destRow: Int, destCol: Int, isWhite: Bool) -> Bool {
        for piece in pieces {
            if destRow == piece.row && destCol == piece.col {
                if piece.isWhite == isWhite {
                    return true
                }
            }
        }
        return false
    }
    
    func capturePiece(pieceCol: Int, pieceRow: Int, col: Int, row: Int) -> Bool {
        guard let candidate = pieceOn(row: pieceRow, col: pieceCol) else {
            return false
        }
        if canMove(fromCol: candidate.col, fromRow: candidate.row, toCol: col, toRow: row) {
            if (pieceOn(row: row, col: col) != nil) {
                return true
            } else {
                return false
            }
        } else {
            return false
        }
    }
    
    func canKnightMoveFrom(fromRow: Int, fromCol: Int, toRow: Int, toCol: Int) -> Bool {
        return abs(toRow - fromRow) == 1 && abs(toCol - fromCol) == 2 || abs(toRow - fromRow) == 2 && abs(toCol - fromCol) == 1
    }
    
    func canPawnMoveFrom(fromRow: Int, fromCol: Int, toRow: Int, toCol: Int, isWhite: Bool) -> Bool {
        guard let candidate = pieceOn(row: fromRow, col: fromCol) else {
            return false
            
        }
        if isWhite {
            if candidate.row == 6 {
                if (pieceOn(row: fromRow - 1, col: fromCol) != nil) {
                    return false
                } else {
                    return fromRow - 1 == toRow || (pieceOn(row: fromRow - 1, col: fromCol + 1) != nil) || (pieceOn(row: fromRow - 1, col: fromCol - 1) != nil) || fromRow - 2 == toRow
                }
            } else {
                if (pieceOn(row: fromRow - 1, col: fromCol) != nil) {
                    return false
                } else {
                    return fromRow - 1 == toRow || (pieceOn(row: fromRow - 1, col: fromCol + 1) != nil) || (pieceOn(row: fromRow - 1, col: fromCol - 1) != nil)
                }
            }
        } else if !isWhite {
            if candidate.row == 1 {
                if (pieceOn(row: fromRow + 1, col: fromCol) != nil) {
                    return false
                } else {
                    return fromRow + 1 == toRow || (pieceOn(row: fromRow + 1, col: fromCol + 1) != nil) || (pieceOn(row: fromRow + 1, col: fromCol - 1) != nil) || fromRow + 2 == toRow
                }
            } else {
                if (pieceOn(row: fromRow + 1, col: fromCol) != nil) {
                    return false
                } else {
                    return fromRow + 1 == toRow || (pieceOn(row: fromRow + 1, col: fromCol + 1) != nil) || (pieceOn(row: fromRow + 1, col: fromCol - 1) != nil) || fromRow + 2 == toRow
                }
            }
        }
        return false
    }
    
    func canRookMoveFrom(fromRow: Int, fromCol: Int, toRow: Int, toCol: Int) -> Bool {
        return fromRow == toRow || fromCol == toCol
    }
    
    func canKingMoveFrom(fromRow: Int, fromCol: Int, toRow: Int, toCol: Int) -> Bool {
        return abs(toRow - fromRow) == 1 || abs(toCol - fromCol) == 1 || abs(toRow - fromRow) == 1 && abs(toCol - fromCol) == 1
    }
    
    func canBishopMoveFrom(fromRow: Int, fromCol: Int, toRow: Int, toCol: Int) -> Bool {
        return abs(toRow - fromRow) == abs(toCol - fromCol)
    }
    
    func canQueenMoveFrom(fromRow: Int, fromCol: Int, toRow: Int, toCol: Int) -> Bool {
        return canRookMoveFrom(fromRow: fromRow, fromCol: fromCol, toRow: toRow, toCol: toCol) || canBishopMoveFrom(fromRow: fromRow, fromCol: fromCol, toRow: toRow, toCol: toCol)
    }
    
    func isXY(x: Int, y: Int, onPoints pieces: Set<Piece>) -> Piece? {
        for piece in pieces {
            if piece.col == x && piece.row == y {
                return piece
            }
        }
        return nil
    }
    
    var description: String {
        
        var board: String = ""
        for i in 0..<rows {
            for j in 0..<cols {
                if let piece = isXY(x: j, y: i, onPoints: pieces) {
                    switch piece.rank {
                    case .pawn: piece.isWhite ? board.append("P ") : board.append("p ")
                    case .knight: piece.isWhite ? board.append("N ") : board.append("n ")
                    case .bishop: piece.isWhite ? board.append("B ") : board.append("b ")
                    case .rook: piece.isWhite ? board.append("R ") : board.append("r ")
                    case .king: piece.isWhite ? board.append("K ") : board.append("k ")
                    case .queen: piece.isWhite ? board.append("Q ") : board.append("q ")
                    }
                } else {
                    board.append(". ")
                }
            }
            board.append("\n")
        }
        return board
    }
    
    
}
