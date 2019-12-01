//
//  ChessDelegate.swift
//  chess
//
//  Created by Halwong on 2019/10/5.
//  Copyright © 2019 GoldThumb Inc. All rights reserved.
//

import Foundation

protocol ChessDelegate {
    func movePiece(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int)
    func pieceAt(col: Int, row: Int) -> ChessPiece?
    
}
