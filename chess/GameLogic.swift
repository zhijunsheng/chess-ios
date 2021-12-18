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
        pieces.insert(ChessPiece(col: 0, row: 7, isBlack: false, pieceType: .rook, picName: "rook_chess_w"))
        pieces.insert(ChessPiece(col: 7, row: 7, isBlack: false, pieceType: .rook, picName: "rook_chess_w"))
        pieces.insert(ChessPiece(col: 1, row: 0, isBlack: true, pieceType: .knight, picName: "knight_chess_b"))
        pieces.insert(ChessPiece(col: 6, row: 0, isBlack: true, pieceType: .knight, picName: "knight_chess_b"))
        pieces.insert(ChessPiece(col: 1, row: 7, isBlack: false, pieceType: .knight, picName: "knight_chess_w"))
        pieces.insert(ChessPiece(col: 6, row: 7, isBlack: false, pieceType: .knight, picName: "knight_chess_w"))
        /*
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
    
    mutating func move (fromX: Int, fromY: Int, toX: Int, toY: Int) {//-> Bool {
        if toX < 0 || toY < 0 || toX > 7 || toY > 7{
            return //false
        }
        else if let p = pieceAt(column: fromX, row: fromY){
            switch p.pieceType {
            case .king:
                break
            case .queen:
                break
            case .rook:
                rookMove(piece: p, column: toX, row: toY)
            case .bishop:
                break
            case .knight:
                knightMove(piece: p, column: toX, row: toY)
            case .pawn:
                break
            }
        }
    }
    mutating func knightMove(piece: ChessPiece, column:Int, row:Int) {
        if let dest = pieceAt(column: column, row: row){
            if piece.isBlack == dest.isBlack{
                return
            }
        }
        if (abs(column - piece.col) == 2 && abs(row - piece.row) == 1) || (abs(column - piece.col) == 1 && abs(row - piece.row) == 2){
            if let p = pieceAt(column: column, row: row) {
                pieces.remove(p)
            }
            pieces.remove(piece)
            let newPiece = ChessPiece(col: column, row: row, isBlack: piece.isBlack, pieceType: piece.pieceType, picName: piece.picName)
            pieces.insert(newPiece)
            print(self)
            
        }
    }
    
    
    mutating func rookMove(piece: ChessPiece, column:Int, row:Int) {
        if let dest = pieceAt(column: column, row: row){
            if piece.isBlack == dest.isBlack{
                return
            }
        }
        
        if isNotEmptyBetween(fromX: piece.col, fromY: piece.row, toX: column, toY: row){
            return
        }
        if let p = pieceAt(column: column, row: row) {
            pieces.remove(p)
        }
        pieces.remove(piece)
        let newPiece = ChessPiece(col: column, row: row, isBlack: piece.isBlack, pieceType: piece.pieceType, picName: piece.picName)
        pieces.insert(newPiece)
        print(self)
    }
    
    func isNotEmptyBetween(fromX: Int, fromY: Int, toX: Int, toY: Int) -> Bool {
        let smallerX = min(fromX, toX)
        let largerX = max(fromX, toX)
        let smallerY = min(fromY, toY)
        let largerY = max(fromY, toY)
        if smallerX == largerX && smallerY == largerY{
            return false
        }
            
        if smallerX == largerX && smallerY != largerY{
            for i in smallerY + 1 ..< largerY {
                if nil != pieceAt(column: toX, row: i){
                    return true
                }
            }
        }
        if smallerX != largerX && smallerY == largerY{
            for i in smallerX + 1 ..< largerX {
                if nil != pieceAt(column: i, row: fromY){
                    return true
                }
            }
        }
        return false
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
