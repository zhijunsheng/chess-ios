//
//  ChessBoard.swift
//  chess
//
//  Created by Grace Huang on 10/20/19.
//  Copyright © 2019 GoldThumb Inc. All rights reserved.
//

import Foundation

struct ChessBoard: CustomStringConvertible{
    var pieceBox: Set<ChessPiece> = Set<ChessPiece>()
    
    private var backupBox: Set<ChessPiece> = Set<ChessPiece>()
    private var fromCol: Int? = nil
    private var fromRow: Int? = nil
    private var toCol: Int? = nil
    private var toRow: Int? = nil

    mutating func reset() {
        pieceBox.removeAll()
        
        pieceBox.insert(ChessPiece(imageName:"queen_chess_b", col: 3, row: 0, isBlack: true, pieceType: .Queen))
        pieceBox.insert(ChessPiece(imageName:"queen_chess_w", col: 3, row: 7, isBlack: false, pieceType: .Queen))
        for i in 0..<8 {
            pieceBox.insert(ChessPiece(imageName:"pawn_chess_w", col: i, row: 6, isBlack: false, pieceType: .Pawn))
            pieceBox.insert(ChessPiece(imageName:"pawn_chess_b", col: i, row: 1, isBlack: true, pieceType:.Pawn))
            
        }
        
        pieceBox.insert(ChessPiece(imageName:"king_chess_b", col: 4, row: 0, isBlack: true, pieceType: .King))
        pieceBox.insert(ChessPiece(imageName:"king_chess_w", col: 4, row: 7, isBlack: false, pieceType: .King))
        
        for i in 0..<2 {
            pieceBox.insert(ChessPiece(imageName:"rook_chess_b", col: i * 7, row: 0, isBlack: true, pieceType: .Rook))
            pieceBox.insert(ChessPiece(imageName:"rook_chess_w", col: i * 7, row: 7, isBlack: false, pieceType: .Rook))
            
            pieceBox.insert(ChessPiece(imageName:"bishop_chess_b", col: i * 3 + 2, row: 0, isBlack: true, pieceType: .Bishop))
            pieceBox.insert(ChessPiece(imageName:"bishop_chess_w", col: i * 3 + 2, row: 7, isBlack: false, pieceType: .Bishop))
            
            pieceBox.insert(ChessPiece(imageName:"knight_chess_b", col: i * 5 + 1, row: 0, isBlack: true, pieceType: .Knight))
            pieceBox.insert(ChessPiece(imageName:"knight_chess_w", col: i * 5 + 1, row: 7, isBlack: false, pieceType: .Knight))
        }
    }
    
    mutating func canPieceMove(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) -> Bool {
        guard let piece = pieceAt(locationX: fromCol, locationY: fromRow)
            else {
                return false
        }
        switch piece.pieceType {
        case .King:
            return canKingMove(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow)
        case .Rook:
            return canRookMove(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow)
        case .Bishop:
            return canBishopMove(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow)
        case .Queen:
            return canQueenMove(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow)
        case .Knight:
            return canKnightMove(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow)
        case .Pawn:
            return canPawnMove(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow)
        }
    }
    
    func canRookMove(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) -> Bool {
        if isThereVerticalBlocker(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow){
            return false
        } else if isThereHorizantalBlocker(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow){
            return false
        } else if toCol == fromCol && toRow != fromRow || toCol != fromCol && toRow == fromRow {
            return true
        }
        
        return false
    }
    
    func canKnightMove(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) -> Bool {
        if  abs(toCol - fromCol) == 1 && abs(toRow - fromRow) == 2 ||
            abs(toCol - fromCol) == 2 && abs(toRow - fromRow) == 1 {
            return true
        }
        return false
    }
    
    func canBishopMove(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) -> Bool {
        return abs(fromCol - toCol) == abs(fromRow - toRow) && !isThereDiagBlocker(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow)
    }
    
    
    
    
    mutating func canPawnMove(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) -> Bool {
        guard let piece = pieceAt(locationX: fromCol, locationY: fromRow)
            else {
                return false
        }
        
        let landingSpot = pieceAt(locationX: toCol, locationY: toRow)
        
        if isThereEnPassant(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow) {
            guard let takenPiece = pieceAt(locationX: toCol, locationY: fromRow)
                else {
                    return false
            }
            
            pieceBox.remove(takenPiece)
            return true
        }
        
        if piece.isBlack == false {
            if  abs(toCol - fromCol) == 1 && toRow == fromRow - 1 && landingSpot != nil ||
                toCol == fromCol && fromRow - 1 == toRow && landingSpot == nil ||
                toCol == fromCol && fromRow == 6 && toRow == 4 && landingSpot == nil && isThereVerticalBlocker(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow) == false {
                return true
            }
        }
        
        if piece.isBlack {
            if  abs(toCol - fromCol) == 1 && toRow == fromRow + 1 && landingSpot != nil ||
                toCol == fromCol && fromRow + 1 == toRow && landingSpot == nil ||
                toCol == fromCol && fromRow == 1 && toRow == 3 && landingSpot == nil && isThereVerticalBlocker(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow) == false {
                return true
            }
        }
        
//        if  {
//            <#code#>
//        }
        
        
        return false
    }
    
    func canKingMove(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) -> Bool {
        if  abs(fromCol - toCol) == 1 && toRow == fromRow ||
            abs(toRow - fromRow) == 1 && fromCol == toCol ||
            abs(fromRow - toRow) == 1 && abs(fromCol - toCol) == 1 {
            return true
        }
        return false
    }
    
    func canQueenMove(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) -> Bool {
        return canBishopMove(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow) || canRookMove(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow)
    }
    
    
    
    
    mutating func isThereEnPassant(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) -> Bool {
        guard let movingPiece = pieceAt(locationX: fromCol, locationY: fromRow)
            else {
                return false
        }
        
        if movingPiece.isBlack && fromRow == 4 && toRow == fromRow + 1 {
            if didPieceJustMove(col: toCol, row: fromRow) && abs(toCol - fromCol) == 1{
                return true
            }
        }
        
        if movingPiece.isBlack == false && fromRow == 3 && toRow == fromRow - 1 {
            if didPieceJustMove(col: toCol, row: fromRow) && abs(toCol - fromCol) == 1{
                return true
            }
        }
        
        return false
    }
    
    func didPieceJustMove(col: Int, row: Int) -> Bool {
        guard let piece = pieceAt(locationX: col, locationY: row)
            else {
                return false
        }
        
        if backupBox.contains(piece) {
            return false
        }
        
        return true
    }
    
    
    func isThereVerticalBlocker(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) -> Bool {
        let delta = abs(fromRow - toRow)
        guard delta > 1 else {
            return false
        }

        for i in 1..<delta {
            if  fromCol == toCol && pieceAt(locationX: fromCol, locationY: fromRow - i) != nil && fromRow > toRow ||
                fromCol == toCol && pieceAt(locationX: fromCol, locationY: fromRow + i) != nil && fromRow < toRow{
                return true
            }
        }
        
        return false
    }
    
    func isItPromotion(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) -> Bool {
        guard let piece = pieceAt(locationX: toCol, locationY: toRow)
            else {
                return false
        }
        
        if toRow == 7 && piece.pieceType == .Pawn || toRow == 0 && piece.pieceType == .Pawn {
            return true
        }
        return false
    }
    
    mutating func promote(col: Int, row: Int, newRank: ChessRank) {
        guard let piece = pieceAt(locationX: col, locationY: row)
            else {
                return
        }
        var imageName: String = ""
        if piece.isBlack == false {
            switch newRank {
            case .Queen:
                imageName = "queen_chess_w"
            case .Rook:
                imageName = "rook_chess_w"
            case .Bishop:
                imageName = "bishop_chess_w"
            case .Knight:
                imageName = "knight_chess_w"
            default:
                break
            }
        }
        
        if piece.isBlack {
            switch newRank {
            case .Queen:
                imageName = "queen_chess_b"
            case .Rook:
                imageName = "rook_chess_b"
            case .Bishop:
                imageName = "bishop_chess_b"
            case .Knight:
                imageName = "knight_chess_b"
            default:
                break
            }
        }
        
        pieceBox.remove(piece)
        pieceBox.insert(ChessPiece(imageName: imageName, col: col, row: row, isBlack: piece.isBlack, pieceType: newRank))
    }
    
    func isThereHorizantalBlocker(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) -> Bool {
        let delta = abs(fromCol - toCol)
        guard delta > 1 else {
            return false
        }
        
        for i in 1..<delta {
            if  fromRow == toRow && pieceAt(locationX: fromCol - i, locationY: fromRow) != nil && fromCol > toCol ||
                fromRow == toRow && pieceAt(locationX: fromCol + i, locationY: fromRow) != nil && fromCol < toCol{
                return true
            }
        }
        
        return false
    }
    
    func isThereDiagBlocker(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) -> Bool {
        let delta = abs(fromCol - toCol)
        guard delta > 1 else {
            return false
        }
        
        for i in 1..<delta {
            if  pieceAt(locationX: fromCol - i, locationY: fromRow - i) != nil && fromCol > toCol && fromRow > toRow ||
                pieceAt(locationX: fromCol - i, locationY: fromRow + i) != nil && fromCol > toCol && fromRow < toRow ||
                pieceAt(locationX: fromCol + i, locationY: fromRow - i) != nil && fromCol < toCol && fromRow > toRow ||
                pieceAt(locationX: fromCol + i, locationY: fromRow + i) != nil && fromCol < toCol && fromRow < toRow {
                return true
            }
        }
        
        return false
    }
    
    
    mutating func movePiece(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) {
        backupBox = pieceBox
        self.fromCol = fromCol
        self.fromRow = fromRow
        self.toCol = toCol
        self.toRow = toRow

        guard let movingPiece = pieceAt(locationX: fromCol, locationY: fromRow) else {
            return
        }
        
        if let targetPiece = pieceAt(locationX: toCol, locationY: toRow) {
            if targetPiece.isBlack == movingPiece.isBlack {
                return
            }
            pieceBox.remove(targetPiece)
        }
        pieceBox.remove(movingPiece)
        pieceBox.insert(ChessPiece(imageName: movingPiece.imageName, col: toCol, row: toRow, isBlack: movingPiece.isBlack, pieceType: movingPiece.pieceType))
    }
    
    mutating func goBack() {
        pieceBox = backupBox
    }
    
    func pieceAt(locationX: Int, locationY: Int) -> ChessPiece? {
        for piece in pieceBox {
            if locationX == piece.col && locationY == piece.row {
                return piece
            }
        }
        return nil
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
        let singlePiece = pieceBox.first!
        
        var desc: String = ""
        desc += "  "

        for i in 0..<8 {
            desc += "\(i) "
        }
        
        desc += "\n"

        for row in 0..<8 {
            desc += "\(row) "

            for col in 0..<8 {
                if col == singlePiece.col && row == singlePiece.row{
                    desc += "Q "
                } else {
                    desc += ". "
                }
            }
            desc += "\n"
        }
        return desc
    }
}


