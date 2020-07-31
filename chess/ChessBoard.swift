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
    
    func canPieceMove(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) -> Bool {
        guard let piece = pieceAt(locationX: fromCol, locationY: fromRow)
            else {
                return false
        }
        
        if piece.pieceType == .Rook {
            return canRookMove(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow)
        }
        
        return true
    }
    
    func canRookMove(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) -> Bool {
        guard let piece = pieceAt(locationX: fromCol, locationY: fromRow)
              else {
            return false
        }
          // blocker
//        if pieceAt(locationX: fromCol - 1, locationY: fromRow) ||{
//            <#code#>
//        }
        
        if toCol == fromCol && toRow != fromRow || toCol != fromCol && toRow == fromRow{
            return true
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


