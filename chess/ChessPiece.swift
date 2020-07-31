//
//  ChessPiece.swift
//  chess
//
//  Created by Grace Huang on 10/31/19.
//  Copyright © 2019 GoldThumb Inc. All rights reserved.
//

import Foundation

struct ChessPiece: Hashable {
    let imageName: String
    let col: Int
    let row: Int
    let isBlack: Bool
    let pieceType: ChessRank
}


