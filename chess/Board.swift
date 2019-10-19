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
        
        guard let piece = pieceOn(col: fromCol, row: fromRow) else {
            return
        }

        if canMove(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow) {
            if capturePiece(pieceCol: fromCol, pieceRow: fromRow, col: toCol, row: toRow) {
                guard let target = pieceOn(col: toCol, row: toRow) else {
                    return
                }
                pieces.remove(target)
                pieces.remove(piece)
                pieces.insert(Piece(col: toCol, row: toRow, imageName: piece.imageName, isWhite: piece.isWhite, rank: piece.rank))
                isWhiteTurn = !isWhiteTurn
            } else {
                pieces.remove(piece)
                pieces.insert(Piece(col: toCol, row: toRow, imageName: piece.imageName, isWhite: piece.isWhite, rank: piece.rank))
                isWhiteTurn = !isWhiteTurn
            }
        }
        
    }
    
    func canMove(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) -> Bool {
        guard let candidate = pieceOn(col: fromCol, row: fromRow) else {
            return false
        }
        
        if isDestOutOfBoard(destCol: toCol, destRow: toRow) ||
            isDestOnOwnPieces(destCol: toCol, destRow: toRow, isWhite: candidate.isWhite) ||
           candidate.isWhite != isWhiteTurn {
            return false
        }
        switch candidate.rank {
        case .pawn:
            return canPawnMove(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow, isWhite: candidate.isWhite)
        case .knight:
            return canKnightMove(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow)
        case .bishop:
            return canBishopMove(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow)
        case .rook:
            return canRookMove(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow)
        case .king:
            return canKingMove(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow)
        case .queen:
            return canQueenMove(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow)
        }
    }
    
    func pieceOn(col: Int, row: Int) -> Piece? {
        for piece in pieces {
            if row == piece.row && col == piece.col {
                return piece
            }
        }
        return nil
    }
    
    func isDestOutOfBoard(destCol: Int, destRow: Int) -> Bool {
        if destRow < 0 || destCol < 0 || destRow > 7 || destCol > 7 {
            return true
        }
        return false
    }
    
    func isDestOnOwnPieces(destCol: Int, destRow: Int, isWhite: Bool) -> Bool {
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
        guard let candidate = pieceOn(col: pieceCol, row: pieceRow) else {
            return false
        }
        if canMove(fromCol: candidate.col, fromRow: candidate.row, toCol: col, toRow: row) {
            if (pieceOn(col: col, row: row) != nil) {
                return true
            } else {
                return false
            }
        } else {
            return false
        }
    }
    
    func canKnightMove(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) -> Bool {
        return abs(toRow - fromRow) == 1 && abs(toCol - fromCol) == 2 || abs(toRow - fromRow) == 2 && abs(toCol - fromCol) == 1
    }
    
    func canPawnMove(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int, isWhite: Bool) -> Bool {
        guard let candidate = pieceOn(col: fromCol, row: fromRow) else {
            return false
        }
        
        if isWhite && (pieceOn(col: fromCol, row: fromRow - 1) == nil) {
            if candidate.row == 6 {
                return (fromRow - 1 == toRow || (pieceOn(col: fromCol + 1, row: fromRow - 1) != nil) || (pieceOn(col: fromCol - 1, row: fromRow - 1) != nil) || fromRow - 2 == toRow)
            } else {
                return fromRow - 1 == toRow || (pieceOn(col: fromCol + 1, row: fromRow - 1) != nil) || (pieceOn(col: fromCol - 1, row: fromRow - 1) != nil)
            }
        }
        
        if !isWhite && (pieceOn(col: fromCol, row: fromRow + 1) == nil) {
            if candidate.row == 1 {
                return fromRow + 1 == toRow || (pieceOn(col: fromCol + 1, row: fromRow + 1) != nil) || (pieceOn(col: fromCol - 1, row: fromRow + 1) != nil) || fromRow + 2 == toRow
            } else {
                return fromRow + 1 == toRow || (pieceOn(col: fromCol + 1, row: fromRow + 1) != nil) || (pieceOn(col: fromCol - 1, row: fromRow + 1) != nil) || fromRow + 2 == toRow
            }
        }
        return false
    }
    
    func canRookMove(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) -> Bool {
        return (fromRow == toRow || fromCol == toCol) && numPiecesInBetween(fromRow: fromRow, fromCol: fromCol, toCol: toCol, toRow: toRow) == 0
    }
    
    func canKingMove(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) -> Bool {
        return abs(toRow - fromRow) == 1 || abs(toCol - fromCol) == 1 || abs(toRow - fromRow) == 1 && abs(toCol - fromCol) == 1
    }
    
    func canBishopMove(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) -> Bool {
        return abs(toRow - fromRow) == abs(toCol - fromCol) && numPiecesInBetween(fromRow: fromRow, fromCol: fromCol, toCol: toCol, toRow: toRow) == 0
    }
    
    func canQueenMove(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) -> Bool {
        return canRookMove(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow) || canBishopMove(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow)
    }
    
    func isXY(x: Int, y: Int, onPoints pieces: Set<Piece>) -> Piece? {
        for piece in pieces {
            if piece.col == x && piece.row == y {
                return piece
            }
        }
        return nil
    }
    
    func isBeingAttacked(candidate: Piece) -> Bool {
        for piece in pieces {
            switch piece.rank {
            case .pawn:
                    if canPawnMove(fromCol: piece.col, fromRow: piece.row, toCol: candidate.col, toRow: candidate.row, isWhite: piece.isWhite) == true {
                return true
                }
            case .knight:
                if canKnightMove(fromCol: piece.col, fromRow: piece.row, toCol: candidate.col, toRow: candidate.row) == true {
                    return true
                }
            case .bishop:
                if canBishopMove(fromCol: piece.col, fromRow: piece.row, toCol: candidate.col, toRow: candidate.row) == true {
                    return true
                }
            case .rook:
                if canRookMove(fromCol: piece.col, fromRow: piece.row, toCol: candidate.col, toRow: candidate.row) == true {
                    return true
                }
            case .queen:
                if canQueenMove(fromCol: piece.col, fromRow: piece.row, toCol: candidate.col, toRow: candidate.row) == true {
                    return true
                }
            case .king:
                if canKingMove(fromCol: piece.col, fromRow: piece.row, toCol: candidate.col, toRow: candidate.row) == true {
                    return true
                }
            }
            
            return false
        }
        return false
    }
    
    /*
     
     0 1 2 3 4 5 6 7
   0 . . . . . . . .
   1 . . . . . . . .
   2 . o . * * . o .
   3 . . . . . . . .
   4 . . . . . . . .
   5 . . . o o . . .
   6 . . . o . o . .
   7 . . . . . . . .
     
     */
    func numPiecesInBetween(fromRow: Int, fromCol: Int, toCol: Int, toRow: Int) -> Int {
        var count = 0
        
        /*
         
         0 1 2 3 4 5 6 7
         0 . . . . . . . .
         1 . o . . . . . .
         2 . . o . . . . .
         3 . . . o . . . .
         4 . . . . . . . .
         5 . . . . . . . .
         6 . . . . . . . .
         7 . . . . . . . .
         
         0 1 2 3 4 5 6 7
         0 . . . . . . . .
         1 . . o . . . . .
         2 . . . o . . . .
         3 . . . . o . . .
         4 . . . . . . . .
         5 . . . . . . . .
         6 . . . . . . . .
         7 . . . . . . . .
         
         0 1 2 3 4 5 6 7
         0 . . . . . . . .
         1 . . . . o . . .
         2 . . . o . . . .
         3 . . o . . . . .
         4 . . . . . . . .
         5 . . . . . . . .
         6 . . . . . . . .
         7 . . . . . . . .
         
         */
        if fromCol == 0 && fromRow == 0 && toCol == 0 && toRow == 0 {
            return 0
        }
        
        // 0 + 1...1 - 1
        // 1 + 1...2 - 1
        // 2 + 1...3 - 1
        // 3 + 1...4 - 1
        // 4 + 1...5 - 1
        // 5 + 1...6 - 1
        // 6 + 1...7 - 1
        if abs(fromRow - toRow) == 1 { // |01 - 56| = 55
            return count
        } else if abs(fromCol - toCol) == 1 {
            return count
        }
        
        if fromCol == toCol {
            for i in (min(fromRow, toRow)) + 1...(max(fromRow, toRow)) - 1 {
                if pieceOn(col: fromCol, row: i) != nil {
                    count += 1
                }
            }
        } else if fromRow == toRow {
            // o . * * . o
            //
            for i in (min(fromCol, toCol)) + 1...(max(fromCol, toCol)) - 1 {
                if pieceOn(col: i, row: fromRow) != nil {
                    count += 1
                }
            }
        } else if abs(toCol - fromCol) == abs(toRow - fromRow) {
            
            for i in (min(fromCol, toCol)) + 1...(max(fromCol, toCol)) - 1 {
                for j in (min(fromRow, toRow)) + 1...(max(fromRow, toRow)) - 1{
                    if pieceOn(col: i, row: j) != nil {
                        count += 1
                    }
                }
            }
        }
        
        return count
    }

    var description: String {
        var board: String = ""
        board += "  0 1 2 3 4 5 6 7"
        board.append("\n")
        for i in 0..<rows {
            board += "\(i) "
            for j in 0..<cols {
                if let piece = isXY(x: j, y: i, onPoints: pieces) {
                    switch piece.rank {
                    case .pawn: piece.isWhite ? board += "P " : (board += "p ")
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
