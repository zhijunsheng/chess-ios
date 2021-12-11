//
//  GameLogic.swift
//  chess
//
//  Created by Harry Shen on 11/6/21.
//  Copyright © 2021 GoldThumb Inc. All rights reserved.
//

import Foundation

struct GameLogic: CustomStringConvertible {
    
    var pieces: Set<ChessPiece> = []
    
    mutating func restart() {
        /*
        for i in 0..<8 {
            pieces.insert(ChessPiece(col: i, row: 1, isBlack: true, pieceType: .pawn, picName: "pawn_chess_b"))
        }
        for i in 0..<8 {
            pieces.insert(ChessPiece(col: i, row: 6, isBlack: false, pieceType: .pawn, picName: "pawn_chess_w"))
        }
         */
        pieces.insert(ChessPiece(col: 0, row: 0, isBlack: true, pieceType: .rook, picName: "rook_chess_b"))
        pieces.insert(ChessPiece(col: 7, row: 0, isBlack: true, pieceType: .rook, picName: "rook_chess_b"))
        pieces.insert(ChessPiece(col: 0, row: 7, isBlack: true, pieceType: .rook, picName: "rook_chess_w"))
        pieces.insert(ChessPiece(col: 7, row: 7, isBlack: true, pieceType: .rook, picName: "rook_chess_w"))
        /*
        pieces.insert(ChessPiece(col: 1, row: 0, isBlack: true, pieceType: .knight, picName: "knight_chess_b"))
        pieces.insert(ChessPiece(col: 6, row: 0, isBlack: true, pieceType: .knight, picName: "knight_chess_b"))
        pieces.insert(ChessPiece(col: 1, row: 7, isBlack: true, pieceType: .knight, picName: "knight_chess_w"))
        pieces.insert(ChessPiece(col: 6, row: 7, isBlack: true, pieceType: .knight, picName: "knight_chess_w"))
        pieces.insert(ChessPiece(col: 2, row: 0, isBlack: true, pieceType: .bishop, picName: "bishop_chess_b"))
        pieces.insert(ChessPiece(col: 5, row: 0, isBlack: true, pieceType: .bishop, picName: "bishop_chess_b"))
        pieces.insert(ChessPiece(col: 2, row: 7, isBlack: true, pieceType: .bishop, picName: "bishop_chess_w"))
        pieces.insert(ChessPiece(col: 5, row: 7, isBlack: true, pieceType: .bishop, picName: "bishop_chess_w"))
        pieces.insert(ChessPiece(col: 3, row: 0, isBlack: true, pieceType: .king, picName: "king_chess_b"))
        pieces.insert(ChessPiece(col: 4, row: 0, isBlack: true, pieceType: .queen, picName: "queen_chess_b"))
        pieces.insert(ChessPiece(col: 4, row: 7, isBlack: true, pieceType: .queen, picName: "queen_chess_w"))
        pieces.insert(ChessPiece(col: 3, row: 7, isBlack: true, pieceType: .king, picName: "king_chess_w"))
                                                                                                            */
    }
    
    func pieceAt(column:Int, row:Int) -> ChessPiece? {
        for p in pieces {
            if p.col == column && p.row == row{
                return p
            }
        }
        return nil
    }
    
    mutating func move (fromX: Int, fromY: Int, toX: Int, toY: Int){
        if let p = pieceAt(column: fromX, row: fromY){
            if(p.pieceType == .rook){
                
                if let newPiece = rookMove(piece: p, column: toX, row: toY){
                    pieces.remove(p)
                    pieces.insert(newPiece)
                }
                
            }
        }
    }
    
    mutating func rookMove(piece: ChessPiece, column:Int, row:Int) -> ChessPiece? {
        if piece.col==column && piece.row != row {
            if piece.row>row {
                for i in row - 1..<piece.row {
                    if pieceAt(column: column, row: i) != nil {
                        return nil
                    }
                }
                
                if let p = pieceAt(column: column, row: row) {
                    if piece.isBlack != p.isBlack {
                        /*
                        pieces.remove(p)
                        var newPiece = ChessPiece(col: column, row: row, isBlack: piece.isBlack, pieceType: piece.pieceType)
                        pieces.insert(newPiece)
                        pieces.remove(piece)
                         */
                        return ChessPiece(col: column, row: row, isBlack: piece.isBlack, pieceType: piece.pieceType, picName: piece.picName)
                    }
                    return nil
                }
                /*
                let newPiece = ChessPiece(col: column, row: row, isBlack: piece.isBlack, pieceType: piece.pieceType)
                pieces.insert(newPiece)
                pieces.remove(piece)
                 */
                return ChessPiece(col: column, row: row, isBlack: piece.isBlack, pieceType: piece.pieceType, picName: piece.picName)
            }
            else{
                for i in piece.row + 1..<row {
                    if pieceAt(column: column, row: i) != nil {
                        return nil
                    }
                }
                
                if let p = pieceAt(column: column, row: row) {
                    if piece.isBlack != p.isBlack {
                        /*
                        pieces.remove(p)
                        let newPiece = ChessPiece(col: column, row: row, isBlack: piece.isBlack, pieceType: piece.pieceType)
                        pieces.insert(newPiece)
                        pieces.remove(piece)
                         */
                        return ChessPiece(col: column, row: row, isBlack: piece.isBlack, pieceType: piece.pieceType, picName: piece.picName)
                    }
                    return nil
                }
                /*
                let newPiece = ChessPiece(col: column, row: row, isBlack: piece.isBlack, pieceType: piece.pieceType)
                pieces.insert(newPiece)
                pieces.remove(piece)
                 */
                return ChessPiece(col: column, row: row, isBlack: piece.isBlack, pieceType: piece.pieceType, picName: piece.picName)
            }
        }
        if piece.col != column && piece.row == row {
            if piece.col>column {
                for i in column - 1..<piece.col {
                    if pieceAt(column: i, row: row) != nil {
                        return nil
                    }
                }
                
                if let p = pieceAt(column: column, row: row) {
                    if piece.isBlack != p.isBlack {
                        pieces.remove(p)
                        /*
                        let newPiece = ChessPiece(col: column, row: row, isBlack: piece.isBlack, pieceType: piece.pieceType)
                        pieces.insert(newPiece)
                        pieces.remove(piece)
                         */
                        return ChessPiece(col: column, row: row, isBlack: piece.isBlack, pieceType: piece.pieceType, picName: piece.picName)
                    }
                    return nil
                }
                /*
                let newPiece = ChessPiece(col: column, row: row, isBlack: piece.isBlack, pieceType: piece.pieceType)
                pieces.insert(newPiece)
                pieces.remove(piece)
                 */
                return ChessPiece(col: column, row: row, isBlack: piece.isBlack, pieceType: piece.pieceType, picName: piece.picName)
            }
            else{
                for i in piece.col + 1..<column  {
                    if pieceAt(column: i, row: row) != nil {
                        return nil
                    }
                }
                
                if let p = pieceAt(column: column, row: row) {
                    if piece.isBlack != p.isBlack {
                        /*
                        pieces.remove(p)
                        let newPiece = ChessPiece(col: column, row: row, isBlack: piece.isBlack, pieceType: piece.pieceType)
                        pieces.insert(newPiece)
                        pieces.remove(piece)
                         */
                        return ChessPiece(col: column, row: row, isBlack: piece.isBlack, pieceType: piece.pieceType, picName: piece.picName)
                    }
                    return nil
                }
                /*
                let newPiece = ChessPiece(col: column, row: row, isBlack: piece.isBlack, pieceType: piece.pieceType)
                pieces.insert(newPiece)
                pieces.remove(piece)
                 */
                return ChessPiece(col: column, row: row, isBlack: piece.isBlack, pieceType: piece.pieceType, picName: piece.picName)
            }
        }
        return nil
    }
    
    var description: String {
        var desc: String = ""
        for row in 0..<8 {
            desc += String(9 - row - 1)
            desc += " "
            for col in 0..<8 {
                if let p = pieceAt(column: col, row: row) {
                    switch p.pieceType {
                    case .king:
                        desc += p.isBlack ? "K" : "k"
                    case .queen:
                        desc += p.isBlack ? "Q" : "q"
                    case .rook:
                        desc += p.isBlack ? "R" : "r"
                    case .bishop:
                        desc += p.isBlack ? "B" : "b"
                    case .knight:
                        desc += p.isBlack ? "N" : "n"
                    case .pawn:
                        desc += p.isBlack ? "P" : "p"
                    }
                }
                else{
                    desc += "."
                }
                
                desc += " "
            }
            desc += "\n"
        }
        desc += "  A B C D E F G H"
        return desc
    }
}
