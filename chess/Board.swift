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
    
    var pieces: Set<Piece> = Set<Piece>()
    
    mutating func movePiece(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) {
        guard let piece = pieceOn(row: fromRow, col: fromCol) else {
            return
        }
        if canMove(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow) {
            pieces.remove(piece)
            pieces.insert(Piece(row: toRow, col: toCol, imageName: piece.imageName, isWhite: piece.isWhite, rank: piece.rank))
        }

    }
    
    func canMove(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) -> Bool {
        return true
    }
    
    mutating func move(piece: Piece, destinationRow: Int, destinationCol: Int) -> Bool {
        switch piece.rank {
        case .pawn: if !canPawnMoveFrom(fromRow: piece.row, fromCol: piece.col, toRow: destinationRow, toCol: destinationCol, isWhite: piece.isWhite) {
                return false
            }
        case .knight:
            if !canKnightMoveFrom(fromRow: piece.row, fromCol: piece.col, toRow: destinationRow, toCol: destinationCol) {
                return false
            }
        case .bishop:
            if !canBishopMoveFrom(fromRow: piece.row, fromCol: piece.col, toRow: destinationRow, toCol: destinationCol, isWhite: piece.isWhite) {
                return false
            }
        case .rook: if !canRookMoveFrom(fromRow: piece.row, fromCol: piece.col, toRow: destinationRow, toCol: destinationCol, isWhite: piece.isWhite) {
                return false
            }
        case .king: if !canKingMoveFrom(fromRow: piece.row, fromCol: piece.col, toRow: destinationRow, toCol: destinationCol, isWhite: piece.isWhite) {
                return false
            }
        case .queen: break
        }
        
        return true
        
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
    
    func canKnightMoveFrom(fromRow: Int, fromCol: Int, toRow: Int, toCol: Int) -> Bool {
        if abs(toRow - fromRow) == 1 && abs(toCol - fromCol) == 2 || abs(toRow - fromRow) == 2 && abs(toCol - fromCol) == 1 {
            return true
        }
        return false
    }
    
    func canPawnMoveFrom(fromRow: Int, fromCol: Int, toRow: Int, toCol: Int, isWhite: Bool) -> Bool {
        if isDestOutOfBoard(destRow: toRow, destCol: toCol) || isDestOnOwnPieces(destRow: toRow, destCol: toCol, isWhite: isWhite) {
            return false
        }
        if toRow - fromRow == 1 {
            return true
        }
        return false
    }
    
    func canRookMoveFrom(fromRow: Int, fromCol: Int, toRow: Int, toCol: Int, isWhite: Bool) -> Bool {
        if isDestOutOfBoard(destRow: toRow, destCol: toCol) || isDestOnOwnPieces(destRow: toRow, destCol: toCol, isWhite: isWhite) {
            return false
        }
        
        if fromRow == toRow || fromCol == toCol {
            return true
        }
        return false
    }
    
    func canKingMoveFrom(fromRow: Int, fromCol: Int, toRow: Int, toCol: Int, isWhite: Bool) -> Bool {
        if isDestOutOfBoard(destRow: toRow, destCol: toCol) || isDestOnOwnPieces(destRow: toRow, destCol: toCol, isWhite: isWhite) {
            return false
        }
        if abs(toRow - fromRow) == 1 || abs(toCol - fromCol) == 1 || abs(toRow - fromRow) == 1 && abs(toCol - fromCol) == 1 {
            return true
        }
        return false
    }
    
    func canBishopMoveFrom(fromRow: Int, fromCol: Int, toRow: Int, toCol: Int, isWhite: Bool) -> Bool {
        if isDestOutOfBoard(destRow: toRow, destCol: toCol) || isDestOnOwnPieces(destRow: toRow, destCol: toCol, isWhite: isWhite) {
            return false
        }
        if abs(toRow - fromRow) == abs(toCol - fromCol) {
            return true
        }
        return false
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
