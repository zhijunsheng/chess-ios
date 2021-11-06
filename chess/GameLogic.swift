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
        for i in 0..<8 {
            pieces.insert(ChessPiece(col: i, row: 1, isBlack: true, pieceType: .pawn))
        }
        for i in 0..<8 {
            pieces.insert(ChessPiece(col: i, row: 6, isBlack: false, pieceType: .pawn))
        }
    }
    
    func pieceAt(column:Int, row:Int) -> ChessPiece? {
        for p in pieces {
            if p.col == column && p.row == row{
                return p
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
