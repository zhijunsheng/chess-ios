//
//  ChessPiece.swift
//  chess
//
//  Created by Kenneth Wu on 2022-02-16.
//  Copyright © 2022 GoldThumb Inc. All rights reserved.
//

import Foundation

struct ChessPiece: Hashable {
    let col: Int
    let row: Int
    let whatPiece: ChessMan
    let isWhite: Bool
    let imageName: String
    
}
