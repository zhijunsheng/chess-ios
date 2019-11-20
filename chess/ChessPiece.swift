//
//  ChessPiece.swift
//  chess
//
//  Created by Elaine on 2019/10/27.
//  Copyright © 2019 GoldThumb Inc. All rights reserved.
//

import Foundation

struct ChessPiece: Hashable {
    let rank: String //,"queen", "king", "pawn", "bishop" , "rook", "knight"
    let isWhite: Bool
    let col: Int// 
    let row: Int
    let imageName: String
}
