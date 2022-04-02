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
        
        pieces.insert(ChessPiece(col: 2, row: 0, isBlack: true, pieceType: .bishop, picName: "bishop_chess_b"))
        pieces.insert(ChessPiece(col: 5, row: 0, isBlack: true, pieceType: .bishop, picName: "bishop_chess_b"))
        pieces.insert(ChessPiece(col: 2, row: 7, isBlack: false, pieceType: .bishop, picName: "bishop_chess_w"))
        pieces.insert(ChessPiece(col: 5, row: 7, isBlack: false, pieceType: .bishop, picName: "bishop_chess_w"))
        pieces.insert(ChessPiece(col: 4, row: 0, isBlack: true, pieceType: .queen, picName: "queen_chess_b"))
        pieces.insert(ChessPiece(col: 4, row: 7, isBlack: false, pieceType: .queen, picName: "queen_chess_w"))
        /*
        pieces.insert(ChessPiece(col: 3, row: 7, isBlack: true, pieceType: .king, picName: "king_chess_w"))
        pieces.insert(ChessPiece(col: 3, row: 0, isBlack: true, pieceType: .king, picName: "king_chess_b"))
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
            if let dest = pieceAt(column: toX, row: toY),dest.isBlack == p.isBlack{
                return
            }
            var found:Bool = false
            switch p.pieceType {
            case .king:
                break
            case .queen:
                if queenMove(piece: p, column: toX, row: toY) {
                    found = true
                }
            case .rook:
                if rookMove(piece: p, column: toX, row: toY) {
                    found = true
                }
            case .bishop:
                if bishopMove(piece: p, column: toX, row: toY) {
                    found = true
                }
            case .knight:
                if knightMove(piece: p, column: toX, row: toY) {
                    found = true
                }
            case .pawn:
                break
            }
            if found {
                if let dest2 = pieceAt(column: toX, row: toY){
                    pieces.remove(dest2)
                }
                pieces.remove(p)
                let newPiece = ChessPiece(col: toX, row: toY, isBlack: p.isBlack, pieceType: p.pieceType, picName: p.picName)
                pieces.insert(newPiece)
            }
        }
    }
    func queenMove(piece: ChessPiece, column:Int, row:Int) -> Bool{
        if(abs(piece.col - column) == abs(piece.row - row)){
            if isNotEmptyBetweenDiagnol(fromX: piece.col, fromY: piece.row, toX: column, toY: row){
                return false
            }
            return true
        }
        else if(piece.col == column || piece.row == row){
            if isNotEmptyBetweenLine(fromX: piece.col, fromY: piece.row, toX: column, toY: row){
                return false
            }
            return true
        }
        return false
    }
    func knightMove(piece: ChessPiece, column:Int, row:Int) -> Bool {
        if (abs(column - piece.col) == 2 && abs(row - piece.row) == 1) || (abs(column - piece.col) == 1 && abs(row - piece.row) == 2){
            return true
        }
        return false
    }
    
    func bishopMove(piece: ChessPiece, column:Int, row:Int) -> Bool {
        if isNotEmptyBetweenDiagnol(fromX: piece.col, fromY: piece.row, toX: column, toY: row){
            return false
        }
        if(abs(piece.col - column) != abs(piece.row - row)){
            return false
        }
        return true
    }
    
    
    
    func rookMove(piece: ChessPiece, column:Int, row:Int) -> Bool {
        if isNotEmptyBetweenLine(fromX: piece.col, fromY: piece.row, toX: column, toY: row){
            return false
        }
        if(piece.col != column && piece.row != row){
            return false
        }
        return true
    }
    func isNotEmptyBetweenDiagnol(fromX: Int, fromY: Int, toX: Int, toY: Int) -> Bool {
        let smallerX = min(fromX, toX)
        let smallerY = min(fromY, toY)
        let largerY = max(fromY, toY)
        if fromX == toX && fromY == toY{
            return false
        }
        
        if(abs(fromX-toX)==abs(fromY-toY)){
            if(smallerX == toX && smallerY == toY){
                for i in 1..<largerY-smallerY {
                    if nil != pieceAt(column:toX + i, row: toY+i){
                        return true
                    }
                }
            }
            if(smallerX == fromX && smallerY == toY){
                for i in 1..<largerY-smallerY {
                    if nil != pieceAt(column:toX + i, row: toY - i){
                        return true
                    }
                }
            }
            if(smallerX == fromX && smallerY == fromY){
                for i in 1..<largerY-smallerY {
                    if nil != pieceAt(column:toX - i, row: toY - i){
                        return true
                    }
                }
            }
            if(smallerX == toX && smallerY == toY){
                for i in 1..<largerY-smallerY {
                    if nil != pieceAt(column:toX - i, row: toY+i){
                        return true
                    }
                }
            }
        }
        return false
    }
    func isNotEmptyBetweenLine(fromX: Int, fromY: Int, toX: Int, toY: Int) -> Bool {
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
