//
//  ChessPiece.swift
//  chess
//
//  Created by Halwong on 2019/9/15.
//  Copyright © 2019 GoldThumb Inc. All rights reserved.
//

import Foundation

struct ChessPiece: Hashable {
    let rank: ChessPieceRank
    let col: Int
    let row: Int
    let isWhite: Bool
    let imgName: String
}

    


