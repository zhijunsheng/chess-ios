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
    var thing = Set<Piece>()
    var pieces: Set<Piece> = Set<Piece>()
    var lastTng: Piece?
    
    
    mutating func withdraw() {
        pieces = thing
        isWhiteTurn = !isWhiteTurn
    }
    
    mutating func canPromote(col: Int, row: Int, isWhite: Bool) -> Bool {
        guard let piece = pieceOn(col: col, row: row) else { return false }
        if piece.cm == .pawn && piece.isWhite {
            if row == 0 {
                return true
            }
        } else if piece.cm == .pawn && !piece.isWhite {
            if row == 7 {
                return true
            }
        }
        return false
    }
    
    mutating func initPieces() {
        pieces.insert(Piece(col: 0, row: 0, imageName: "rook_chess_b", isWhite: false, cm: .rook))
        pieces.insert(Piece(col: 1, row: 0, imageName: "knight_chess_b", isWhite: false, cm: .knight))
        pieces.insert(Piece(col: 2, row: 0, imageName: "bishop_chess_b", isWhite: false, cm: .bishop))
        pieces.insert(Piece(col: 3, row: 0, imageName: "queen_chess_b", isWhite: false, cm: .queen))
        pieces.insert(Piece(col: 4, row: 0, imageName: "king_chess_b", isWhite: false, cm: .king))
        pieces.insert(Piece(col: 5, row: 0, imageName: "bishop_chess_b", isWhite: false, cm: .bishop))
        pieces.insert(Piece(col: 6, row: 0, imageName: "knight_chess_b", isWhite: false, cm: .knight))
        pieces.insert(Piece(col: 7, row: 0, imageName: "rook_chess_b", isWhite: false, cm: .rook))
        pieces.insert(Piece(col: 0, row: 7, imageName: "rook_chess_w", isWhite: true, cm: .rook))
        pieces.insert(Piece(col: 1, row: 7, imageName: "knight_chess_w", isWhite: true, cm: .knight))
        pieces.insert(Piece(col: 2, row: 7, imageName: "bishop_chess_w", isWhite: true, cm: .bishop))
        pieces.insert(Piece(col: 3, row: 7, imageName: "queen_chess_w", isWhite: true, cm: .queen))
        pieces.insert(Piece(col: 4, row: 7, imageName: "king_chess_w", isWhite: true, cm: .king))
        pieces.insert(Piece(col: 5, row: 7, imageName: "bishop_chess_w", isWhite: true, cm: .bishop))
        pieces.insert(Piece(col: 6, row: 7, imageName: "knight_chess_w", isWhite: true, cm: .knight))
        pieces.insert(Piece(col: 7, row: 7, imageName: "rook_chess_w", isWhite: true, cm: .rook))
        
        for bpawnNo in 0...7 {
            pieces.insert(Piece(col: bpawnNo, row: 1, imageName: "pawn_chess_b", isWhite: false, cm: .pawn))
        }
        for wpawnNo in 0...7 {
            pieces.insert(Piece(col: wpawnNo, row: 6, imageName: "pawn_chess_w", isWhite: true, cm: .pawn))
        }

    }
    
    mutating func movePiece(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) {
        thing = pieces

        guard let piece = pieceOn(col: fromCol, row: fromRow) else {
            return
        }

        if canMove(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow) {
            if canCapturePiece(pieceCol: fromCol, pieceRow: fromRow, col: toCol, row: toRow) {
                let r = toRow + (piece.isWhite ? 1 : -1)
                if lastTng != nil && piece.cm == .pawn && lastTng?.isWhite != piece.isWhite && lastTng == pieceOn(col: toCol, row: r) {
                    let target = pieceOn(col: toCol, row: r)!
                    lastTng = nil
                    pieces.remove(target)
                    pieces.remove(piece)
                    pieces.insert(Piece(col: toCol, row: toRow, imageName: piece.imageName, isWhite: piece.isWhite, cm: piece.cm))
                    isWhiteTurn = !isWhiteTurn
                } else {
                    guard let target = pieceOn(col: toCol, row: toRow) else {
                        return
                    }
                    lastTng = nil
                    pieces.remove(target)
                    pieces.remove(piece)
                    pieces.insert(Piece(col: toCol, row: toRow, imageName: piece.imageName, isWhite: piece.isWhite, cm: piece.cm))
                    isWhiteTurn = !isWhiteTurn
                }
            } else {
                if piece.cm == .pawn && toRow == fromRow + (piece.isWhite ? -2 : 2) && fromCol == toCol {
                    lastTng = piece
                    lastTng!.row = piece.row + (piece.isWhite ? -2 : 2)
                } else {
                    lastTng = nil
                }
                pieces.remove(piece)
                pieces.insert(Piece(col: toCol, row: toRow, imageName: piece.imageName, isWhite: piece.isWhite, cm: piece.cm))
                isWhiteTurn = !isWhiteTurn
            }
        }
    }
    
    mutating func canMove(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) -> Bool {
        guard let candidate = pieceOn(col: fromCol, row: fromRow) else {
            return false
        }
        
        if isDestOutOfBoard(destCol: toCol, destRow: toRow) ||
            isDestOnOwnPieces(destCol: toCol, destRow: toRow, isWhite: candidate.isWhite) ||
           candidate.isWhite != isWhiteTurn {
            return false
        }
        switch candidate.cm {
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
    
    mutating func canCapturePiece(pieceCol: Int, pieceRow: Int, col: Int, row: Int) -> Bool {
        guard let candidate = pieceOn(col: pieceCol, row: pieceRow) else {
            return false
        }
        if canMove(fromCol: candidate.col, fromRow: candidate.row, toCol: col, toRow: row) {
            if (pieceOn(col: col, row: row) != nil) {
                return true
            } else if candidate.cm == .pawn && row == candidate.row + (candidate.isWhite ? -1 : 1) && abs(col - candidate.col) == 1 && lastTng != nil {
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
    
    mutating func canPawnMove(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int, isWhite: Bool) -> Bool {
        guard let candidate = pieceOn(col: fromCol, row: fromRow) else {
            return false
        }
        let lt = lastTng
        if pieceOn(col: toCol, row: toRow) != nil {
            if pieceOn(col: toCol, row: toRow)?.isWhite != candidate.isWhite {
                return toRow == fromRow + (isWhite ? -1 : 1) && abs(toCol - fromCol) == 1
            } else {
                return false
            }
        } else {
            if fromRow == (isWhite ? 6 : 1) {
                return (toRow == fromRow + (isWhite ? -1 : 1) || toRow == fromRow + (isWhite ? -2 : 2)) && toCol == fromCol
            } else if lt != nil && lt?.isWhite != candidate.isWhite {
                if abs(lt!.col - fromCol) == 1 && fromRow == lt!.row && toCol == lt!.col && toRow == lt!.row + (candidate.isWhite ? -1 : 1) {
                    return true
                } else {
                    return toRow == fromRow + (isWhite ? -1 : 1) && toCol == fromCol
                }
            } else {
                return toRow == fromRow + (isWhite ? -1 : 1) && toCol == fromCol
            }
        }
    }
    
    func canRookMove(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) -> Bool {
        return (fromRow == toRow || fromCol == toCol) && numPiecesInBetween(fromRow: fromRow, fromCol: fromCol, toCol: toCol, toRow: toRow) == 0
    }
    
    func canKingMove(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) -> Bool {
        return abs(toRow - fromRow) == 1 || abs(toCol - fromCol) == 1 || abs(toRow - fromRow) == 1 && abs(toCol - fromCol) == 1
    }
    
    func canBishopMove(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) -> Bool {
        print(numPiecesInBetween(fromRow: fromRow, fromCol: fromCol, toCol: toCol, toRow: toRow))
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
    
    // there is a huge potential trap ... watch out down the road
    mutating func isBeingAttackedAt(col: Int, row: Int) -> Bool {
        for piece in pieces {
            if piece != pieceOn(col: col, row: row) && canQueenMove(fromCol: piece.col, fromRow: piece.row, toCol: col, toRow: row) {
                return true
            }
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
            /*
             3 c
             4 r
             6 c
             7 r
             4, 5  5, 6
             6-3 == 6-3 yes
             
             */
//            for i in 1..<abs(toCol - fromCol) {
//
//                count += pieceOn(col: fromCol + i, row: fromRow + i)
//            }
            for i in 1..<abs(toCol - fromCol) {
                let colSign = toCol > fromCol ? 1 : -1
                let rowSign = toRow > fromRow ? 1 : -1
                count += pieceOn(col: fromCol + i * colSign, row: fromRow + i * rowSign) != nil ? 1 : 0
            }
        }
        return count
    }

    var description: String {
        var board: String = ""
        board += "◊ 0 1 2 3 4 5 6 7"
        board.append("\n")
        for i in 0..<rows {
            board += "\(i) "
            for j in 0..<cols {
                if let piece = isXY(x: j, y: i, onPoints: pieces) {
                    switch piece.cm {
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
