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
    let player: Player
    let rank: ChessRank
    
    init(col: Int, row: Int, imageName: String, isWhite: Bool, rank: ChessRank) {
        self.col = col
        self.row = row
        self.imageName = imageName
        self.player = isWhite ? .white : .black
        self.rank = rank
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(row)
        hasher.combine(col)
    }
    
    var isWhite: Bool {
        switch player {
        case .white:
            return true
        case .black:
            return false
        }
    }
}
