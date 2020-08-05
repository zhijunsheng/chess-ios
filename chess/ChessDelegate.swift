//
//  ChessDelegate.swift
//  chess
//
//  Created by Felix Lo on 2020/8/3.
//  Copyright © 2020 GoldThumb Inc. All rights reserved.
//

import Foundation

protocol ChessDelegate {
    func pieceAt(col: Int, row: Int) -> Piece?
    func movePiece(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int)
    
    
}
