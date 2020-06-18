//
//  ChessDelegate.swift
//  Chess
//
//  Created by Zhijun Sheng on 2020-06-04.
//  Copyright © 2020 Gold Thumb Inc. All rights reserved.
//

import Foundation

protocol ChessDelegate {
    func movePiece(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int)
    func pieceAt(col: Int, row: Int) -> ChessPiece?
}
