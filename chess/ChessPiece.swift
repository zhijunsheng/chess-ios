//
//  ChessPiece.swift
//  chess
//
//  Created by Harry Shen on 11/6/21.
//  Copyright © 2021 GoldThumb Inc. All rights reserved.
//

import Foundation
struct ChessPiece: Hashable {
    let col: Int
    let row: Int
    let isBlack: Bool
    let pieceType: PieceType

}
