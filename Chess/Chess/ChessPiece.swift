//
//  ChessPiece.swift
//  Chess
//
//  Created by Zhijun Sheng on 2020-06-03.
//  Copyright © 2020 Gold Thumb Inc. All rights reserved.
//

import Foundation

struct ChessPiece: Hashable {
    let col: Int
    let row: Int
    let imageName: String
    let isWhite: Bool
    let rank: ChessRank
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(row)
        hasher.combine(col)
    }
}
