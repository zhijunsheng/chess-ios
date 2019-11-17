//
//  ChessPiece.swift
//  chess
//
//  Created by Lambert Lin on 2019/11/10.
//  Copyright © 2019 GoldThumb Inc. All rights reserved.
//

import Foundation

struct ChessPiece: Hashable {
    let col: Int // 0 1 2 3 4 5 6 7
    let row: Int // 0 1 2 3 4 5 6 7
    let rank: String // "rook", "knight", "pawn", "bishop", "king", "queen"
    let isBlack: Bool // true, false
    let imageName: String 
    
}
