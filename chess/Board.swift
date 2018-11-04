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
    
//    func isXY(x: Int, y: Int, onPoints points: [Piece]) -> Bool {
//        var onSnake = false
//        for cell in points {
//            if cell.col == x && cell.row == y {
//                onSnake = true
//                break
//            }
//        }
//        return onSnake
//    }
    func isXY(x: Int, y: Int, onPoints pieces: [Piece]) -> Piece? {
        for piece in pieces {
            if piece.col == x && piece.row == y {
                return piece
            }
        }
        return nil
    }
    
    let pieces: [Piece] = [Piece(row: 1, col: 1, isWhite: false, rank: .pawn),
                           Piece(row: 0, col: 0, isWhite: false, rank: .rook),
                           Piece(row: 7, col: 3, isWhite: true, rank: .bishop),
                           Piece(row: 0, col: 4, isWhite: false, rank: .queen),
    ]
    
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
