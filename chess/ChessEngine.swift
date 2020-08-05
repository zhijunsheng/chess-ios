//
//  ChessEngine.swift
//  chess
//
//  Created by Felix Lo on 2020/7/29.
//  Copyright © 2020 GoldThumb Inc. All rights reserved.
//

import Foundation

struct ChessEngine {
    var pieces: Set<Piece> = []
    
    mutating func initGame() {
        pieces.insert(Piece(col: 3, row: 7, player: .white, rank: .queen, imageName: "queen_w"))
        pieces.insert(Piece(col: 4, row: 7, player: .white, rank: .king, imageName: "king_w"))
        pieces.insert(Piece(col: 3, row: 0, player: .black, rank: .queen, imageName: "queen_b"))
        pieces.insert(Piece(col: 4, row: 0, player: .black, rank: .king, imageName: "king_b"))
        
        for i in 0 ..< 8 {
            pieces.insert(Piece(col: i, row: 6, player: .white, rank: .pawn, imageName: "pawn_w"))
            pieces.insert(Piece(col: i, row: 1, player: .black, rank: .queen, imageName: "pawn_b"))
        }
        
        for i in 0 ..< 2 {
            pieces.insert(Piece(col: i * 7, row: 0, player: .black, rank: .rook, imageName: "rook_b"))
            pieces.insert(Piece(col: i * 5 + 1, row: 0, player: .black, rank: .knight, imageName: "knight_b"))
            pieces.insert(Piece(col: i * 3 + 2, row: 0, player: .black, rank: .bishop, imageName: "bishop_b"))
            pieces.insert(Piece(col: i * 7, row: 7, player: .white, rank: .rook, imageName: "rook_w"))
            pieces.insert(Piece(col: i * 5 + 1, row: 7, player: .white, rank: .knight, imageName: "knight_w"))
            pieces.insert(Piece(col: i * 3 + 2, row: 7, player: .white, rank: .bishop, imageName: "bishop_w"))
        }
    }
    
    func pieceAt(col: Int, row: Int) -> Piece? {
        
        for piece in pieces {
            if col == piece.col && row == piece.row {
                return piece
            }
        }
        
        return nil
    }
    
    mutating func moveP(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) {
        guard let movingPiece = pieceAt(col: fromCol, row: fromRow) else {
            return
        }
        
        pieces.remove(movingPiece)
        pieces.insert(Piece(col: toCol, row: toRow, player: movingPiece.player, rank: movingPiece.rank, imageName: movingPiece.imageName))
    }
    
}
